<?php
   header("Content-Type:text/javascript; charset=utf-8");
   error_reporting(0); 
   set_time_limit(0);

   define('MIFAREIP',			'192.168.2.125');
   define('MIFAREPORT',			4660);
   define('ACCEPTEDACK',			3);
   
   $status = true;
   //$out  = array(0x00);

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
   
   function socketClose($socket){
      socket_shutdown($socket, 1);
      usleep(500);
      socket_shutdown($socket, 0);
      socket_close($socket);
   }
   
   $usrNo = $_REQUEST['usrNo'];          //(2^10-1)
   //$groupNo = '59572';
   //$cardNo = '20468';
   //$passwdNo = '0000';
   $flag = '1';   //04:卡無效, 01:卡有效
   $timezone = '1';
   $Range = 1;
   $ReaderID = $_REQUEST['ReaderID'];
   $commonProtocol = getprotobyname("tcp");
 
   //$socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
   $socket = socket_create(AF_INET, SOCK_STREAM, $commonProtocol);

   $connection = socket_connect($socket, MIFAREIP, MIFAREPORT);

   //socket_bind($socket, MIFAREIP, MIFAREPORT);
   
  // socket_listen($socket);

   if(!socket_set_option($socket, SOL_SOCKET, SO_REUSEADDR, 1)) {
      echo 'Unable to set option on socket: '. socket_strerror(socket_last_error()) . PHP_EOL;
   }

//$spawn = socket_accept($socket);

   //socket_set_block($socket);
   
   //socket_accept($socket);
   
   //socket_set_nonblock($socket);

   
   $usrNoArr = hexArr($usrNo);
   //$groupNoArr = hexArr($groupNo);
   //$cardNoArr = hexArr($cardNo);
  // $passwdNoArr = hexArr($passwdNo);

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
   
   $bufferSend = sprintf("%02X%02X", 0x7E, $arrcount);
   for($j=0; $j<$arrcount; $j++){
      $bufferSend .= sprintf("%02X", $dataArr[$j]);
   }
   
  // echo $bufferSend.'<br/>';
   
   $status &= socket_write($socket, $buffer);
   //socket_send($socket, $buffer);
 
/*
 *    卡機 回傳值
 */
 
    
   $out  = array();
   //$outPan = array();
   $count=0;

   do{
      $count++;
      $outPan = str_split(socket_read($socket, 1024), 1);
      array_push($out, $outPan);
   }while(!(ord($outPan[3])==ACCEPTEDACK || ord($outPan[4])==$ReaderID) && $count < 10);
/*
   while($count--){
      $outPan = str_split(socket_read($socket, 1024), 1);
      array_push($out, $outPan);
      sleep(1);
   }
*/
  // print_r($out);

   for($k=0; $k<count($out); $k++){
      if(sprintf("%d", ord($out[$k][0]))==='126'){
         $output = $out[$k];
      }
   }

   //$output = array_pop($out);
/*
   for($m=0; $m<count($output); $m++){
      echo sprintf("%02X,", ord($output[$m]));
   }
   echo '<br/>';
   echo sprintf("%02d號卡機, 資料長度:%02d", ord($output[4]), ord($output[1]));
   */
   $output2 = array_slice($output, 4, -4);

   //echo '<br/>';
   $name = array('', '男湯手環', '女湯手環', '男宿手環', '女宿手環');
   $location = array('', '男湯', '女湯', '男宿', '女宿');
 /*
   $k=1;
   for($i=1; $i<count($output2); $i++){
      if($i%8==1){
         //echo sprintf("使用者[%05d] :", $k);
         //echo sprintf("INSERT INTO `data_table` (`store_id`, `usrno`, `name`, `location`, `groupno`, `no`, `uby`) VALUES('1', '%05d', '%s', '%s', '%05d', '%05d', '%s'), <br/>", $k, $name[$ReaderID].sprintf("%02d", $k), $location[$ReaderID], hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1]))), hexdec(sprintf("%02X%02X", ord($output2[$i+2]), ord($output2[$i+3]))), 'ZDN');
         echo sprintf("INSERT INTO `data_table` (`store_id`, `usrno`, `name`, `location`, `groupno`, `no`, `uby`) VALUES('1', '%05d',", $k);
      }
      
      //echo sprintf("%02X", ord($output2[$i]));
      if($i%8==1){
        // echo sprintf("組碼[%02X%02X]", ord($output2[$i]), ord($output2[$i+1]));
         //echo "組碼[".hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1])))."]";
         echo sprintf("'%05d', ", hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1]))));
      }    
      
      if($i%8==3){
        // echo sprintf("卡號[%02X%02X]", ord($output2[$i]), ord($output2[$i+1]));
         //echo "卡號[".hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1])))."]";
         echo sprintf("'%05d', ", hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1]))));
      }      
      
      if($i%8==5){
         //echo sprintf("密碼[%02X%02X]", ord($output2[$i]), ord($output2[$i+1]));
         //echo hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1])));
         echo "'ZDN'";
      }
   
  
      if($i%8==0){
         echo '),<br/>';
         $k++;
      }
   }

*/
$outbuffer = array();
for($i=1, $k=(int)$usrNo; $i<count($output2); $i+=7, $k++){
   //echo sprintf("INSERT INTO `data_table` (`store_id`, `usrno`, `name`, `location`, `groupno`, `no`, `uby`) VALUES('1', '%05d', '%s', '%s', '%05d', '%05d', '%s'), <br/>", $k, $name[$ReaderID].sprintf("%02d", $k++), $location[$ReaderID], hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1]))), hexdec(sprintf("%02X%02X", ord($output2[$i+2]), ord($output2[$i+3]))), 'ZDN');
   array_push($outbuffer, array(
      'usrno'=>sprintf("%05d", $k),
      'name'=>$name[$ReaderID].sprintf("%02d", $k),
      'location'=>$location[$ReaderID],
      'groupno'=>sprintf("%05d", hexdec(sprintf("%02X%02X", ord($output2[$i]), ord($output2[$i+1])))),
      'no'=>sprintf("%05d", hexdec(sprintf("%02X%02X", ord($output2[$i+2]), ord($output2[$i+3]))))
   ));
   
}

echo json_encode($outbuffer);

//socketClose($socket);
//socketClose($connection);

?>