<?php
header('Content-Type: application/x-javascript; charset=utf-8');

define('DS', DIRECTORY_SEPARATOR);
define('ZPATH_BASE', str_replace('includes'.DS.'php','', dirname(__FILE__)));
include_once 'defines.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';

$sql = isset($_REQUEST['sql']) ? $_REQUEST['sql'] : null;
$tb = isset($_REQUEST['tb']) ? $_REQUEST['tb'] : null;
//$tb = "data_class";
//$sql = "SELECT * FROM Client_data_item where 1;";
$ZDB = new ZDatabase();

$result = $ZDB->Zquery($sql);
if($result){
$temp = 'new Array(';
	foreach($result as $val){
		$temp .= "\"REPLACE INTO {$tb}(".implode(',', array_keys($val)).") VALUES('".implode("', '", array_values($val))."')\",";
	}
	echo $temp .="-1)";
}
//echo $temp;

unset($result);
unset($ZDB);
$sql = $tb = $temp = null;
?>