<?php
error_reporting(E_ALL); 
define('DS', DIRECTORY_SEPARATOR);
//echo dirname(__FILE__);
//exit;
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', str_replace('/guard', '', dirname(__FILE__)));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
} 
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
require_once ZPATH_BASE.DS.'configuration.php';

function checkxor($arr){
   $xor = 0xFF;
   for($i=0;$i<count($arr);$i++){
      $xor ^= $arr[$i]; 
   }
   return $xor;
}
function checksum($arr){
   $sum = 0x00;
   for($i=0;$i<count($arr);$i++){
      $sum += $arr[$i]; 
   }
   while($sum>>16){
      $sum = ($sum&0xFFFF)+($sum>>16);
   }
   return hexdec(substr(sprintf("%04X", $sum), -2));
}

function hexArr($str){
   $str = sprintf("%04X", $str);
   return array(
      hexdec(substr($str, 0, 2)),
      hexdec(substr($str, -2))
   );
}

$mifareNo = '01';
$usrStart = 6;         
$usrEnd = 8;          //(2^10-1)
$groupNo = '00000';
$cardNo = '00000';
$passwdNo = '0000';
$flag = '4';   //04:卡無效, 01:卡有效
$timezone = '1';


define('MIFAREIP',			'192.168.2.125');
define('MIFAREPORT',			4660);
set_time_limit(0);
$commonProtocol = getprotobyname("tcp");
//$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
$socket = socket_create(AF_INET, SOCK_STREAM, $commonProtocol);

$connection = socket_connect($socket, MIFAREIP, MIFAREPORT);

socket_bind($socket, MIFAREIP, MIFAREPORT);

socket_listen($socket);

if(!socket_set_option($socket, SOL_SOCKET, SO_REUSEADDR, 1)) {
   echo 'Unable to set option on socket: '. socket_strerror(socket_last_error()) . PHP_EOL;
}

socket_set_nonblock($socket);

$status = true;

for($i=$usrStart; $i<$usrEnd; $i++):
   $mifareNo = $mifareNo;
   $usrNoArr = hexArr($i);
   $groupNoArr = hexArr($groupNo);
   $cardNoArr = hexArr($cardNo);
   $passwdNoArr = hexArr($passwdNo);
  
   $dataArr = array(dechex((int)$mifareNo), 0x83, 
      $usrNoArr[0], $usrNoArr[1], $groupNoArr[0], $groupNoArr[1], 
      $cardNoArr[0], $cardNoArr[1], $passwdNoArr[0], $passwdNoArr[1], 
      (int)$flag, (int)$timezone
   );   
   
   array_push($dataArr, checkxor($dataArr));
   array_push($dataArr, checksum($dataArr));

   $arrcount = count($dataArr);
   $buffer = sprintf("%c%c", 0x7E, $arrcount);
   for($j=0; $j<$arrcount; $j++){
      $buffer .= sprintf("%c", $dataArr[$j]);
   }
   
   $bufferSend = sprintf("%02X%02X", 0x7E, $arrcount);
   for($j=0; $j<$arrcount; $j++){
      $bufferSend .= sprintf("%02X", $dataArr[$j]);
   }
   
   echo $i.': '.$bufferSend.'<br/>';  
   $status &= socket_write($socket, $buffer);
   
   
   ob_flush();
   flush();

   sleep(1);
endfor;

socket_close($connection);

?>