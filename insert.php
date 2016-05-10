<?php
define('DS', DIRECTORY_SEPARATOR);
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', dirname(__FILE__));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
}
require_once 'configuration.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
$CONFIG = new ZConfig();
$ZDB = new ZDatabase();
for($i=1, $j=1; $i<146; $i++, $j++){
   $sql = sprintf("INSERT INTO `data_table` (`store_id`, `usrno`, `name`, `location`, `remark`, `uby`) VALUES('%d', '%05d', '%s', '%s', '%s', '%s');", 1, $i, '員工卡'.sprintf("%02d", $j), '女宿', '', 'ZDN');
   $sql2 = sprintf("UPDATE `data_table` SET `groupno` = '%05d' WHERE `table_id` = '%d';", 59572, $i);
   //echo $sql;
   //$ZDB->execute($sql);
   //$ZDB->execute($sql2);
}
?>