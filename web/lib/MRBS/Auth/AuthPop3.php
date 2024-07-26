<?php
namespace MRBS\Auth;

/*
 * Authentication scheme that uses POP3 as the source for user
 * authentication.
 *
 * To use this authentication scheme set the following
 * things in config.inc.php:
 *
 * $auth["realm"] = "MRBS";    // Or any other string
 * $auth["type"]  = "pop3";
 *
 * Then, you may configure admin users:
 *
 * $auth["admin"][] = "pop3user1";
 * $auth["admin"][] = "pop3user2";
 */

use MRBS\Exception;

class AuthPop3 extends Auth
{
  private const CONNECT_TIMEOUT = 15; // seconds
  private const STREAM_TIMEOUT = 15; // seconds

  private $hosts;
  private $ports;


  public function __construct()
  {
    global $pop3_host, $pop3_port;

    // Build an array of hosts and ports from the config settings
    $this->hosts = array();
    $this->ports = array();

    // Check that if there is an array of hosts and an array of ports
    // then the number of each is the same
    if (is_array($pop3_host) && is_array($pop3_port) &&
        (count($pop3_port) != count($pop3_host)))
    {
      $message = "MRBS config error: number of POP3 hosts does not match number of POP3 ports.";
      throw new Exception($message);
    }

    // Transfer the list of POP3 hosts to a new value to ensure that an array is always used.
    // If a single value is passed then turn it into an array
    $this->hosts = (is_array($pop3_host)) ? $pop3_host : array($pop3_host);

    // Create an array of the port numbers to match the number of
    // hosts if a single port number has been passed.
    $this->ports = (is_array($pop3_port)) ? $pop3_port : array_pad($this->ports, count($this->hosts), $pop3_port);
  }


  /* validateUser($user, $pass)
   *
   * Checks if the specified username/password pair are valid
   *
   * $user  - The username
   * $pass  - The password
   *
   * Returns:
   *   false    - The pair are invalid or do not exist
   *   string   - The validated username
   */
  public function validateUser(
    #[\SensitiveParameter]
    ?string $user,
    #[\SensitiveParameter]
    ?string $pass)
  {
    // Check if we do not have a username/password
    if (!isset($user) || !isset($pass) || strlen($pass)==0)
    {
      return false;
    }

    // iterate over all hosts and return if you get a successful login
    foreach ($this->hosts as $i => $host)
    {
      $port = $this->ports[$i];
      // Connect to POP3 server
      $stream = fsockopen($host, $port, $error_number, $error_string, self::CONNECT_TIMEOUT);
      if ($stream === false)
      {
        continue;
      }

      stream_set_timeout($stream, self::STREAM_TIMEOUT);
      $response = fgets($stream, 1024);
      if ($response === false)
      {
        trigger_error("fgets() failed using host '$host' and port '$port'", E_USER_WARNING);
        continue;
      }

      // First we try to use APOP, and then if that fails we fall back to
      // traditional stuff

      // Get the shared secret ( something on the greeting line that looks like <XXXX> )
      if (preg_match('/(<[^>]*>)/', $response, $match))
      {
        $shared_secret = $match[0];
      }

      // If we have a shared secret then try APOP
      if (isset($shared_secret) && ($shared_secret !== ''))
      {
        $md5_token = md5("$shared_secret$pass");
        $auth_string = "APOP $user $md5_token\r\n";
        fputs($stream, $auth_string);

        // Read the response. If it's an OK then we're authenticated
        $response = fgets($stream, 1024);
        if (str_starts_with($response, '+OK'))
        {
          fputs($stream, "QUIT\r\n");
          return $user;
        }
      }

      // If we've still not authenticated then try using traditional methods.
      // Need to reconnect if we tried APOP
      $stream = fsockopen($host, $port, $error_number, $error_string, self::CONNECT_TIMEOUT);

      if ($stream === false)
      {
        continue;
      }

      stream_set_timeout($stream, self::STREAM_TIMEOUT);
      // Send standard POP3 USER and PASS commands
      fputs($stream, "USER $user\r\n");
      $response = fgets($stream, 1024);
      if (str_starts_with($response, '+OK'))
      {
        fputs($stream, "PASS $pass\r\n");
        $response = fgets($stream, 1024);
        if (str_starts_with($response, '+OK'))
        {
          return $user;
        }
      }
      fputs($stream, "QUIT\r\n");
    }

    // Return failure
    return false;
  }


  // Checks whether validation of a user by email address is possible and allowed.
  public function canValidateByEmail() : bool
  {
    return true;
  }

}
