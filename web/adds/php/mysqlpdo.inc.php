<?php

/*
####################################################################################################
#  											            				                           #
#		Nombre: misqlpdo.inc								    				                   #
#		Autor:	Omar Chiyean (C)							    				                   #
#		Fecha:	04/04/2019								    				                       #
#		Tipo:	Clase MySQL usando PDO								    				           #
#												    				                               #
#												    				                               #
#		Descripcion:									    				                       #
#			Archivo con rutinas de conexion a una base de datos							           #
#																                                   #
#		Funciones:	 												                               #
#				new MiSQL($u, $p, $bdg) -> Constructor								               #
#				cnxOn()		-> Se conecta a la BD								                   # 
#				cnxOff()	-> Se desconecta de la BD								               #
#				consulta ( $what, $table, $where, $orderby, $limit, $vl )  -> Consultas a la BD	   #
#				enlista	 ( $data )  -> Consultas a la BD							               #
#				insertar ( $table, $values ) -> Inserta datos en la BD						       #
#				actualizar	( $table, $setval, $where, $linea ) -> Actualiza datos en la BD		   #
#				borrar	( $table, $where) -> Borra datos y optimiza la BD						       #
#				optimizar	( $table ) -> Optimiza la BD								               #
#				listaCampos	( $table ) -> Enlista los campos de una tabla de la BD				   #
#																                                   #
#																                                   #
# 		Ultima Modificacion: 12/06/2020											                   #
#			04/04/2019 -> Elaboracion de las rutinas											   #
#			12/06/2020 -> Agregar constructor compatible con PHP > 5							   #
#						  Cambios para PDO											               #
#																                                   #
####################################################################################################
*/

class  MiSQL{
//###################### INICIO CLASE ###################### //
	
		var $dsn;
        var $u;
		var $p;
    	var $dbh;
		var $faf = 0;

//###################### CONSTRUCTOR ###################### //
	
	function __construct( $u, $p, $bdg ){
		$this->u = $u;
		$this->p = $p;
        $this->dsn = "mysql:host=mariadb;dbname=".$bdg;
	}

//###################### CONEXION A LA BD ###################### //
	
	function cnxOn(){
        try {
			$this->dbh = new PDO($this->dsn, $this->u, $this->p);
			$this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);		
		} catch (PDOException $e){
			echo "Error en la conexión a la base de datos";
        }        
	}
	
//###################### DESCONEXIÓN A LA BD ###################### //

	function cnxOff(){
        $this->dbh = null;
    }

//###################### CONSULTA A LA BD ###################### //
	
	function consulta ($what, $table, $where = "", $orderby = "", $limit = "", $lv = array()){
		$rdata = array();
		$i = 0;
		$query = "SELECT " . $what. " FROM ". $table;
		if  ( $where != "" ){ $query .= "  WHERE " . $where;	}
		if  ( $orderby != "" ){ $query .= "  ORDER BY ".$orderby;	}
		if  ( $limit != "" ){ $query .= "  LIMIT ".$limit; }
		$rquery = $this->dbh->prepare($query);
		$rquery->setFetchMode(PDO::FETCH_ASSOC);
		$rquery->execute($lv);
		$this->faf = $rquery->rowCount();
		while($row = $rquery->fetch()){
			$rdata[$i] = $row;   
			$i++;         
		}
		return $rdata;
	}

//###################### LISTADO DE CONSULTA A LA BD ###################### //

	function enlista($data){
		foreach ( $data[0] as $key => $value){
			echo  $key."&nbsp;&nbsp;&nbsp;";
		}
		echo "<br>\r\n";
		for ($i = 0; $i < count($data); $i++){
			foreach ( $data[$i] as $value){
				echo  $value."&nbsp;&nbsp;&nbsp;";
			}
			echo "<br>\r\n";
		}
	}

//######################  INSERCIONES A LA BD ###################### //

	function insertar ( $table, $values ){
		$campos = $this->listaCampos( $table );
		$lc = $lv = "";
		for ($i = 0; $i < count($campos); $i++){
			if ($i == 0){
				$lc = $campos[$i];
                $lv = ":".$campos[$i];
			}else{
				$lc .= ", ".$campos[$i];
				$lv .= ", :".$campos[$i];
			}
            $v[":".$campos[$i]] = $values[$i];
		}
		$query = "INSERT INTO ".$table." (".$lc.") VALUES (".$lv.")";
		$rquery = $this->dbh->prepare($query);
		$rquery->execute($v);
		$this->faf = $rquery->rowCount();
	}

//###################### ACTUALIZACIONES A LA BD ###################### //

	function actualizar( $table, $setval, $where = "", $lv=""){
		$query = "UPDATE  ".$table." SET ".$setval;
		if  ( $where != "" ){ $query .= "  WHERE " . $where;	}
		
		$rquery = $this->dbh->prepare($query);
		$rquery->execute($lv);
		$this->faf = $rquery->rowCount();
	}

//######################  BORRAR Y OPTIMIZAR LA BD ###################### //
	
	function borrar( $table, $where, $vl ){
		$query = "DELETE FROM ".$table." WHERE ".$where;
		$rquery = $this->dbh->prepare($query);
		$rquery->execute($vl);
		$this->faf = $rquery->rowCount();
		$this->optimizar( $table );
	}

//######################  VACIAR LA BD ###################### //
	
	function vaciar( $table ){
		$query = "TRUNCATE TABLE ".$table;
		$rquery = $this->dbh->prepare($query);
		$rquery->execute();
		$this->faf = $rquery->rowCount();
	}

//###################### OPTIMIZAR LA BD ###################### //
	
	function optimizar( $table ){
		$query = "OPTIMIZE TABLE  ".$table;
		$rquery = $this->dbh->prepare($query);
		$rquery->execute();
	}

//###################### LISTADO DE CAMPOS DE LA BD ###################### //
	
	function listaCampos( $table ){
        $r = "DESCRIBE ".$table;
		$res = $this->dbh->prepare($r);
		$res->execute();
		$f = $res->fetchAll(PDO::FETCH_COLUMN);
		return $f;			
	}
	
//###################### Cuantos Registros  tengo en mi tabla ###################### //
	
	function CuentaTotTabla( $table ){
		$r = "SELECT * FROM ". $table;
		$res = $this->dbh->prepare($r);
		$res->execute();
		return $res->rowCount();
	}

//###################### FIN CLASE ###################### //

}	


?>