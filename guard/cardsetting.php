<?php
//header("Content-Type:text/javascript; charset=utf-8");
error_reporting(E_ALL); 
set_time_limit(0);
define('DS', DIRECTORY_SEPARATOR);
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', str_replace(DS.'guard', '', dirname(__FILE__)));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
} 
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
require_once ZPATH_BASE.DS.'configuration.php';


define('MIFAREIP',			'192.168.2.125');
define('MIFAREPORT',			4660);
define('ACCEPTEDACK',			4);


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
   $str = sprintf("%04X", $str);
   return array(
      hexdec(substr($str, 0, 2)),
      hexdec(substr($str, -2))
   );
}


//$location = md5('男湯');
//$usrNo = '00001';
//$groupNo = '59572';
//$cardNo = '20468';
$passwdNo = '0000';
$flag = $_REQUEST['flag'];   //04:卡無效, 01:卡有效
$table_id = $_REQUEST['table_id'];   //04:卡無效, 01:卡有效
$timezone = '1';



$commonProtocol = getprotobyname("tcp");

$socket = socket_create(AF_INET, SOCK_STREAM, $commonProtocol);

$connection = socket_connect($socket, MIFAREIP, MIFAREPORT);
/*
socket_bind($socket, MIFAREIP, MIFAREPORT);

socket_listen($socket);

if(!socket_set_option($socket, SOL_SOCKET, SO_REUSEADDR, 1)) {
   echo 'Unable to set option on socket: '. socket_strerror(socket_last_error()) . PHP_EOL;
}*/
//socket_set_nonblock($socket);

$ZDB = new ZDatabase();

//$mifareAssoc = $ZDB->Zquery("SELECT * FROM `data_table_mifare_assoc` WHERE MD5(`location`) ='{$location}';");
$mifareAssoc = $ZDB->Zquery("SELECT dt.*, dtm.* FROM `data_table` `dt`, `data_table_mifare_assoc` `dtm` WHERE dt.location = dtm.location AND dt.table_id='{$table_id}';");
$status = true;
$out  = array(0x00);

foreach($mifareAssoc as $assoc):
   if(!(empty($assoc['usrno'])&&empty($assoc['groupno'])&&empty($assoc['no']))&&strlen($assoc['usrno'])>4&&strlen($assoc['groupno'])>4&&strlen($assoc['no'])>4){
      
      $ReaderID = (int)$assoc['mifareno'];
      //$usrNoArr = hexArr('00110');
      $usrNoArr = hexArr($assoc['usrno']);
      //$groupNoArr = hexArr('59572');
      $groupNoArr = hexArr($assoc['groupno']);
      //$cardNoArr = hexArr('20468');
      $cardNoArr = hexArr($assoc['no']);
      $passwdNoArr = hexArr($passwdNo);

      $dataArr = array(dechex($ReaderID), 0x83, 
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
         
         echo $bufferSend.'<br/>';
  
      $status &= socket_write($socket, $buffer);
    
      $out  = array();
      $outPan = '';
      try{
         do{
          //  $count++;
            $outPan = str_split(socket_read($socket, 1024), 1);
            array_push($out, $outPan);
         }while(!(ord($outPan[3])==ACCEPTEDACK || ord($outPan[4])==$ReaderID));
      }catch(Exception $e){
      
      }
  }
endforeach;
   


$result = array_pop($out);
//$result = $outPan;
for($m=0; $m<count($result); $m++){
   $val .= sprintf("%02X", ord($result[$m]));
}




echo json_encode(array('status'=>$val));

socket_close($socket);

?>