<?php
/*
echo $data = sprintf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c", 0x7E, 0x0E, 0x01, 0x83, 0x00, 0x01, 0x04, 0x41, 0xEA, 0x4B, 0x04, 0xD2, 0x02, 0x01,0x7E^0x0E^0x01^0x83^0x00^0x01^0x04^0x41^0xEA^0x4B^0x04^0xD2^0x02^0x01,0x7E+0x0E+0x01+0x83+0x00+0x01+0x04+0x41+0xEA+0x4B+0x04+0xD2+0x02+0x01);
echo PHP_EOL;
echo sprintf("%X", 0xFF^0x01^0x83^0x00^0x01^0x04^0x41^0xEA^0x4B^0x04^0xD2^0x02^0x01);
echo substr(sprintf("%X", 0x01+0x83+0x00+0x01+0x04+0x41+0xEA+0x4B+0x04+0xD2+0x02+0x01+0x4D), -2);
echo '<br>';
echo sprintf("%-2X", 0x01+0x83+0x00+0x01+0x04+0x41+0xEA+0x4B+0x04+0xD2+0x02+0x01+0x4D);
echo '<br>';
*/
function FnXOR($arr){
   $tmp = 0xFF;
   for($i=0;$i<count($arr);$i++){
      $tmp ^= $arr[$i]; 
   }
  // return sprintf("%X", $tmp);
   return $tmp;
}
function FnSUM($arr){
   $tmp = 0x00;
   for($i=0;$i<count($arr);$i++){
      $tmp += $arr[$i]; 
   }
   
   while($tmp>>16){
      $tmp = ($tmp&0xFF)+($tmp&0xFF>>16);
   }
   
   return substr(sprintf("%X", $tmp), -2);
}
$dataArr = array(0x01, 0x83, 0x00, 0x0B, 0xE8, 0xB4, 0x4F, 0xF4, 0x00, 0x00, 0x01, 0x01);
$dataArrXOR = FnXOR($dataArr);

echo $dataArrXOR;
echo '<br/>';
//echo 0xFF^0x01^0x83^0x00^0x0B^0xE8^0xB4^0x4F^0xF4^0x00^0x00^0x01^0x01;
array_push($dataArr, $dataArrXOR);
print_r($dataArr);
echo FnSUM($dataArr);
echo '<br/>------------------------------<br/>';
echo sprintf("%X", (0x01+0x83+0x00+0x01+0x04+0x41+0xEA+0x4B+0x04+0xD2+0x02+0x01+0x4D));
echo '<br/>------------------------------<br/>';
echo sprintf("%X", (0x00+0x09+0x01+0x01+0x05+0x30+0x39+0x00+0x00+0x18+0x14+0x00+0xF6));
echo '<br/>------------------------------<br/>';
$aaa = array(0x01,0x83,0x00,0x01,0x04,0x41,0xEA,0x4B,0x04, 0xD2, 0x02, 0x01, 0x4D);
echo '<br/>*************************</br>';

//echo sprintf("%c", hexdec(FnSUM($aaa)));
echo str_pad(dechex((int)'00011'), 4, '0', STR_PAD_LEFT);

?>