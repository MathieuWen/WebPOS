<?php
date_default_timezone_set('Asia/Taipei');
define('DS', DIRECTORY_SEPARATOR);
if(!defined('_ZDEFINES')) {
    define('ZPATH_BASE', str_replace(DS.'includes'.DS.'php','', dirname(__FILE__)));
    require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
} 
require_once ZPATH_BASE.DS.'configuration.php';
$CONFIG = new ZConfig();
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
//include_once ZPATH_LIBRARIES . DS . 'php' . DS . 'class.session.php';
   
header('Content-Type: text/event-stream');
header('Cache-Control: no-cache'); 

function sendMsg($msg) {
echo "data: $msg" . PHP_EOL;
echo PHP_EOL;
ob_flush();
flush();
}
$serverTime = time();

while(true) {
   //$JSON = array('timestamp'=>time(), 'now'=>date("Y-m-d H:i:s", time()), 'employee'=>$_SESSION["emp_name"]);
   $JSON = array('timestamp'=>time(), 'now'=>date("Y-m-d H:i:s", time()));
   sendMsg(json_encode($JSON));
	sleep(1);
}

?>