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
   $tmp = 0xFF;
   for($i=0;$i<count($arr);$i++){
      $tmp ^= $arr[$i]; 
   }
   return $tmp;
}
function checksum($arr){
   $tmp = 0x00;
   for($i=0;$i<count($arr);$i++){
      $tmp += $arr[$i]; 
   }
   while($tmp>>16){
      $tmp = ($tmp&0xFF)+($tmp&0xFF>>16);
   }
   return substr(sprintf("%X", $tmp), -2);
}

function hexArr($str){
   //$str = str_pad(dechex((int)$str), 4, '0', STR_PAD_LEFT);
   $str = sprintf("%04X", $str);
   return array(
      hexdec(substr($str, 0, 2)),
      hexdec(substr($str, -2))
   );
}

$location = md5('男湯');
$usrNo = '00001';          //(2^10-1)
$groupNo = '59572';
$cardNo = '20468';
$passwdNo = '0000';
$flag = '1';   //04:卡無效, 01:卡有效
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

//$spawn = socket_accept($socket);


//socket_set_nonblock($socket);

$ZDB = new ZDatabase();

$mifareAssoc = $ZDB->Zquery("SELECT * FROM `data_table_mifare_assoc` WHERE MD5(`location`) ='{$location}';");
$status = true;

foreach($mifareAssoc as $assoc):

   $mifareNo = $assoc['mifareno'];
   $usrNoArr = hexArr($usrNo);
   $groupNoArr = hexArr($groupNo);
   $cardNoArr = hexArr($cardNo);
   $passwdNoArr = hexArr($passwdNo);

      //$dataArr2 = array(0x01, 0x83, 0x00, 0x0B, 0xE8, 0xB4, 0x4F, 0xF4, 0x00, 0x00, 0x01, 0x01);
/*
   $dataArr = array(dechex((int)$mifareNo), 0x83, 
      $usrNoArr[0], $usrNoArr[1], $groupNoArr[0], $groupNoArr[1], 
      $cardNoArr[0], $cardNoArr[1], $passwdNoArr[0], $passwdNoArr[1], 
      (int)$flag, (int)$timezone
   );   
*/  
   $dataArr = array(dechex((int)$mifareNo), 0x87, 
      $usrNoArr[0], $usrNoArr[1], 0x01
   );

   array_push($dataArr, checkxor($dataArr));
   array_push($dataArr, checksum($dataArr));
/*
   $buffer = sprintf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 0x7E, count($dataArr), $dataArr[0], $dataArr[1], $dataArr[2], $dataArr[3], $dataArr[4], $dataArr[5], $dataArr[6], $dataArr[7], $dataArr[8], $dataArr[9], $dataArr[10], $dataArr[11], $dataArr[12], $dataArr[13]);
*/
   $arrcount = count($dataArr);
   $buffer = sprintf("%c%c", 0x7E, $arrcount);
   for($j=0; $j<$arrcount; $j++){
      $buffer .= sprintf("%c", $dataArr[$j]);
   }
   
   $bufferSend = sprintf("%02X%02X", 0x7E, $arrcount);
   for($j=0; $j<$arrcount; $j++){
      $bufferSend .= sprintf("%02X", $dataArr[$j]);
   }
   
   echo $bufferSend.'<br/>';
   
   $status &= socket_write($socket, $buffer);
 
/*
 *    卡機 回傳值
 */
 
   $out  = array();
   $i=2;
   while($i--){
      array_push($out, str_split(socket_read($socket, 1024), 1));
      sleep(1);
   }
   
endforeach;

for($k=0; $k<count($out); $k++){
   for($m=0; $m<count($out[$k]); $m++){
      echo sprintf("%02X", ord($out[$k][$m]));
   //echo $out[$k];
   }
   echo '<br/>';
}


//echo json_encode(array('status'=>$status));

socket_close($connection);

?>