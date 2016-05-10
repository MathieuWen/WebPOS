<?php
if($_REQUEST['event']==='serversent'&&isset($_REQUEST['event'])){
   header('Content-Type: text/event-stream');
}else{
   header("Content-type: text/html; charset=utf-8");
}
header('Cache-Control: no-cache'); 
define('DS', DIRECTORY_SEPARATOR);
if(file_exists(dirname(__FILE__) . '/defines.php')) {
   include_once dirname(__FILE__) . '/defines.php';
}
	
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', dirname(__FILE__));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
}
require_once 'configuration.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
$CONFIG = new ZConfig();
$ZDB = new ZDatabase();

function draw($ZDB){
$locate = $_REQUEST['location'];
//$sql = "SELECT DT.*, SR.sales_spk, SR.sales_no, SR.sales_amount, unix_timestamp(SR.establishdate) AS establishdate,TIMEDIFF(CURRENT_TIMESTAMP, SR.establishdate) AS totalTime FROM data_table DT LEFT JOIN sales_receipt SR ON (DT.table_id = SR.table_id AND SR.status=10) WHERE DT.store_id = '{$_REQUEST['store_id']}' AND md5(DT.`location`)='{$_REQUEST['location']}';";
$sql = "SELECT DT.*, SR.sales_spk, SR.sales_no, SR.station_no, SR.sales_amount, unix_timestamp(SR.establishdate) AS establishdate,TIMEDIFF(CURRENT_TIMESTAMP, SR.establishdate) AS totalTime, SR.status AS status FROM data_table DT LEFT JOIN sales_receipt SR ON (DT.table_id = SR.table_id AND (SR.status=10 OR SR.status=14)) WHERE DT.store_id = '{$_REQUEST['store_id']}' AND md5(DT.`location`)='{$locate}';";
$txt = '';
   if($result=$ZDB->Zquery($sql)){
      $i=1;
      foreach($result as $val){
         $status = (int)$val['status'];
         if(!empty($val['lock'])){
            $txt.= "<div id='{$locate}{$i}' class='table lock' data-table='{$val['table_id']}' data-lock='{$val['lock']}' data-sales_no='".(empty($val['sales_no'])?'0':$val['sales_no'])."'  data-sales_spk='".(empty($val['sales_spk'])?'0':$val['sales_spk'])."' data-station_no='{$val['station_no']}'><h1>{$val['name']}</h1><p>機號為{$val['lock']}的使用者</p><p>正在修改中</p><p>&nbsp;</p></div>"; 
         //}else if($val['active']==='1'){
         }else if( $status===10 || $status===14 ){
            $checking = ($status===14)?' checking':'';
            $times = empty($val['establishdate'])?'&nbsp;':date("m/d H:i:s", $val['establishdate']);
            $txt.= "<div id='{$locate}{$i}' class='table occupy{$checking}' data-table='{$val['table_id']}' data-sales_no='{$val['sales_no']}' data-sales_spk='{$val['sales_spk']}' data-station_no='{$val['station_no']}'><h1>{$val['name']}&nbsp;</h1><p>開始：{$times}</p><p>累計：{$val['totalTime']}&nbsp;</p><p>金額：".number_format($val['sales_amount'])."&nbsp;</p></div>";
         }else{
            $txt.= "<div id='{$locate}{$i}' class='table empty' data-table='{$val['table_id']}' data-sales_no='0' data-sales_spk='0' data-station_no='0'><h1>{$val['name']}</h1><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></div>";
         }
         $i++;
      }
   }else{
      $txt.= "<div class='nothing'><p>請先至後台建立資料</p></div>";
   }
   return $txt;
}

function sendMsg($msg) {
   echo "data: $msg" . PHP_EOL;
   echo PHP_EOL;
   ob_flush();
   flush();
}

if($_REQUEST['event']==='serversent'&&isset($_REQUEST['event'])){
   while(true) {
      $JSON = array('tabs'=>draw($ZDB));
      sendMsg(json_encode($JSON));
      sleep(1);
   }
}else{
   echo draw($ZDB);
}
?>