<?php
header("Content-Type:text/javascript; charset=utf-8");
include_once("class.ClientSocket.php");

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

  
   $usrNo = $_REQUEST['usrNo'];          //(2^10-1)
   //$groupNo = '59572';
   //$cardNo = '20468';
   //$passwdNo = '0000';
   $usrNoArr = hexArr($usrNo);
   $flag = '1';   //04:卡無效, 01:卡有效
   $timezone = '1';
   $Range = 1;
   $ReaderID = $_REQUEST['ReaderID'];

   $dataArr = array(dechex((int)$ReaderID), 0x87, 
      $usrNoArr[0], $usrNoArr[1], $Range
   );

   array_push($dataArr, checkxor($dataArr));
   array_push($dataArr, checksum($dataArr));

   $arrcount = count($dataArr);
   $buffer = sprintf("%c%c", 0x7E, $arrcount);
   for($j=0; $j<$arrcount; $j++){
      $buffer .= sprintf("%c", $dataArr[$j]);
   }

try {
   $sc = new ClientSocket();
   //$sc->setIp("192.168.2.125");
   //$sc->setPort(4660);
   $sc->open("192.168.2.125", 4660);
   //$sc->open("tw.yahoo.com", 80);
  // $sc->send("GET /\r\n");
  
   $sc->send($buffer);
   //echo json_encode(array('data'=>$sc->recv()));
   
   $out  = array();
   echo json_encode(array('data'=>$sc->recv()));
  // array_push($out, str_split($sc->sendandrecive($buffer), 1));


   $output2 = array_slice($output, 4, -4);
   $name = array('', '男湯手環', '女湯手環', '男宿手環', '女宿手環');
   $location = array('', '男湯', '女湯', '男宿', '女宿');
   $outbuffer = array();
   for($i=1, $k=(int)$usrNo; $i<count($output2); $i+=7, $k++){
      array_push($outbuffer, array(
         'usrno'=>sprintf("%05d", $k),
         'name'=>$name[$ReaderID].sprintf("%02d", $k),
         'location'=>$location[$ReaderID],
         'groupno'=>sprintf("%05d", hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1])))),
         'no'=>sprintf("%05d", hexdec(sprintf("%02X%02X", ord($output2[$i+2]), ord($output2[$i+3]))))
      ));
   }
   //echo json_encode($outbuffer);
}catch (Exception $e){
   echo json_encode(array('errmsg'=>$e->getMessage()));
}
?>