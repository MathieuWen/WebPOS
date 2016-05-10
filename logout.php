<?php
define('DS', DIRECTORY_SEPARATOR);
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', dirname(__FILE__));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
}
require_once 'configuration.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
include_once ZPATH_LIBRARIES . DS . 'php' . DS . 'class.session.php';
$ZDB = new ZDatabase();

session_destroy();
session_write_close();

header("Location:./index.php");

?>