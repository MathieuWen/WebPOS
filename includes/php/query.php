<?php
header('Content-Type: application/json; charset=utf-8');
define('DS', DIRECTORY_SEPARATOR);
define('ZPATH_BASE', str_replace('includes'.DS.'php','', dirname(__FILE__)));
include_once 'defines.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';

$sql = isset($_REQUEST['sql']) ? $_REQUEST['sql'] : null;
$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : null;
$index = isset($_REQUEST['index']) ? $_REQUEST['index'] : null;
$tb = isset($_REQUEST['tb']) ? $_REQUEST['tb'] : null;
//$sql = "SELECT customer_point AS point, customer_deposit AS deposit FROM data_customer WHERE customer_id = 115;";
//$action ="query";
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
		echo "{ 'status' : 'success' }";
	}else{
		echo "{ 'status' : 'fault' }";
	}
	
	if($tb=='sales_receipt'){
		$ZDB->execute("CALL procedure_sales_calculate('{$index}')");
	}
}

unset($ZDB);
$sql = $action = null;
?>