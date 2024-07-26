<?php
    date_default_timezone_set("Etc/GMT+6");

	session_cache_limiter('nocache');
	session_start();
	
	$t3 = md5($_POST['token'] . $_SESSION['t2']);
	if ( $t3 == $_SESSION['token'] ){

	    include_once("mysqlpdo.inc.php");
	    include_once("cnx.inc.php");

		$cnx = new MiSQL($u, $p, $bdg);
		$cnx->cnxOn();

        if ($_POST['h'] == "check"){
			$res = $cnx->consulta("*", "paginas", "pag = :pag", "", "", array(":pag" => $_POST['page']));
            $r['ruta'] = $res[0]['ruta'];
            $r['bg'] = $res[0]['bg'];
            $r['tit'] = $res[0]['tit'];
            $r['cont'] = $res[0]['cont'];
            $s = "OK";
        }else{
            $s = "NA";
        }

        $token1 = md5(uniqid(rand(), true));
		$token2 = md5(uniqid(rand(), true));
		$token3 = md5($token1 . $token2);
		$_SESSION['token']= $token3;
		$_SESSION['t2'] = $token2;
		$r['token'] = $token1;
        $r['s'] = $s;

		$cnx->cnxOff();

		echo json_encode($r);
    }else{
?>
        <!DOCTYPE HTML>
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UMDI Sisal - UNAM</title>
        <link rel="stylesheet" href="adds/forbidden.css" />
        <script type="text/javascript" src="adds/js/jquery-3.7.1.min.js">;</script>
        <script type="text/javascript">
            $(function(){
                $("#g").show();
                $("#w").show();
            });
        </script>
        </head>
        <body>
        <div id="g"></div>
        <div id="w" style="height:240px; margin-top: -120px;">
            <div id="wd">
                <br />
                No tienes permiso para ver esta página
                <br /><br />
                <div id="im"><img src="imagenes/spinner.png" width="100" height="100"></div>
                <img style="display:block; margin-top:-75px; margin-left:125px; margin-bottom:25px;" src="imagenes/stop.png" width="50" height="50" />  
                <br /> Serás direccionado a la página principal en 5 seg..
            </div>
        </div>       
        <script type="text/javascript">
            var x;
            x = setTimeout( acciona, 5000);

            function acciona(){
                clearTimeout(x); 
                this.location = "index.php"		
            }
        </script>	
        </body>
        </html>
<?php
	}
?>