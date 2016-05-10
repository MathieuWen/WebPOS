<?php
header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-cache'); 
define('DS', DIRECTORY_SEPARATOR);
define('ZPATH_BASE', str_replace('includes'.DS.'php','', dirname(__FILE__)));
include_once 'defines.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';

$sql = isset($_REQUEST['sql']) ? $_REQUEST['sql'] : null;
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : null;
$ZDB = new ZDatabase();
if($action == 'query'){
	$result = $ZDB->Zquery($sql);
	if($result){
		echo utf8_encode(json_encode($result));
	}else{
		echo 0;
	}
unset($result);
}else if($action == 'execute'){
	if($ZDB->execute($sql)){
		echo "true";
	}else{
		echo "false";
	}
}

unset($ZDB);
$sql = $action = null;
?>