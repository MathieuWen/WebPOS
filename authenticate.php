<?php
#error_reporting(E_ALL);
define('DS', DIRECTORY_SEPARATOR);
if(file_exists(dirname(__FILE__) . '/defines.php')){
   include_once dirname(__FILE__) . '/defines.php';
}
	
if(!defined('_ZDEFINES')){
   define('ZPATH_BASE', dirname(__FILE__));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
}

require_once 'configuration.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
include_once ZPATH_LIBRARIES . DS . 'php' . DS . 'class.session.php';
class login_class extends ZDatabase{
   private $employee_no = null;
   private $employee_pass = null;
   private $employee_name = null;
   private $store_id = null;
   private $station_no = null;
   public $device = null;
   public $errormsg = null;
   
   function __construct(){
      parent::__construct();
      self::setProperties();
   }

   private function setProperties(){
      $this->employee_no = self::getValue('username');
      $this->employee_pass = self::getValue('userpass');
      $this->store_id = self::getValue('store_id');
      $this->station_no = self::getValue('station_no');
      $this->device = self::getValue('device');
   }
   
   private function getValue($obj){
      return isset($_REQUEST[$obj]) && !empty($_REQUEST[$obj]) ? trim($_REQUEST[$obj]) : false;
   }

   public function start(){
      
      if($this->isDataValid()){
         $sqlArray = self::setSQL();
         $authResult = parent::ZquerySingle($sqlArray['authSQL']);
         if(!empty($authResult)){
            $stationResult = parent::ZquerySingle($sqlArray['stationSQL']);
            if(!empty($stationResult)){
               //$this->station_id = $stationResult;
               $sessionResult = parent::ZquerySingle($sqlArray['sessionSQL']);
               $sessionResult2 = parent::ZquerySingle($sqlArray['sessionSQL2']);
               if((int)$sessionResult===0 || (int)$sessionResult2===1){
            
                  $_SESSION["store"] = json_encode(array_pop(parent::Zquery($sqlArray['getStoreSQL'])));
                  $_SESSION["station"] = json_encode(array_pop(parent::Zquery($sqlArray['getStationSQL'])));
                  $_SESSION["device"] = json_encode(parent::Zquery($sqlArray['getDeviceSQL']));
                  $_SESSION["employee"] = json_encode(array_pop(parent::Zquery($sqlArray['getEmployeeSQL'])));
                  $_SESSION["StationSetting"] = json_encode(array_pop(parent::Zquery($sqlArray['getStationSettingSQL'])));
           
                  $_SESSION["emp_no"] = $this->employee_no;
                  $_SESSION["emp_name"] = $authResult;
                  $_SESSION["store_id"] = $this->store_id;
                  $_SESSION["station_no"] = $this->station_no;
                  $_SESSION["station_id"] = $stationResult;
                  $_SESSION["current_page"] = 'zpos';
                  $_SESSION["ip"] = self::getIP();
                  //print_r($_SESSION);
                  //exit;
                  return true;
               }else{
                  $this->errormsg = '已有相同的機號登入';
               }
            }else{
               $this->errormsg = '尚未開通的機號';
            }
         }else{
            $this->errormsg = '帳號或密碼錯誤';
         }
      }else{
         $this->errormsg = '輸入的資料格式錯誤';
      }
      return false;
   }
   
   private function setSQL(){
      return array(
         "authSQL" =>sprintf("SELECT authenticate('%s', '%s') user;", $this->employee_no, $this->employee_pass),
         "stationSQL" =>sprintf("SELECT `station_id` AS `station` FROM `data_station` WHERE `station_no` ='%s' AND `store_id` = '%s';", $this->station_no, $this->store_id),
         "sessionSQL" =>sprintf("SELECT COUNT(`sesskey`) AS `sess` FROM `sessions` WHERE `value` REGEXP 'station_no.*\"%s\"' AND `value` REGEXP 'store_id.*\"%s\"';", $this->station_no, $this->store_id),
         "sessionSQL2" =>sprintf("SELECT COUNT(`sesskey`) AS `sess` FROM `sessions` WHERE `value` REGEXP 'station_no.*\"%s\"' AND `value` REGEXP 'store_id.*\"%s\"' AND `value` REGEXP 'ip.*\"%s\"';", $this->station_no, $this->store_id, $_SESSION["ip"]),   
         "getStationSQL" =>sprintf("SELECT * FROM `data_station` WHERE `station_no` ='%s' AND `store_id` = '%s';", $this->station_no, $this->store_id),
         "getStoreSQL" =>sprintf("SELECT * FROM `data_store` WHERE `store_id` ='%s';", $this->store_id),
         "getDeviceSQL" =>sprintf("SELECT * FROM `data_device` WHERE `store_id` ='%s' AND `station_id` = (SELECT `station_id` FROM `data_station` WHERE `station_no`='%s');", $this->store_id, $this->station_no),
         "getEmployeeSQL" =>sprintf("SELECT `employee_id` AS `id`, `employee_no` AS `no`, `employee_name` AS `name`, `employee_sex` AS `sex`, `employee_cardnum` AS `card`, `employee_pass` AS `pass`, `employee_tel` AS `tel`, `employee_fax` AS `fax`, `employee_birthday` AS `birth`, `employee_level` AS `level`, `employee_mobile` AS `mobile`, `employee_email` AS `email` FROM `data_employee` WHERE `employee_no` ='%s';", $this->employee_no),
         "getStationSettingSQL" =>sprintf("SELECT `ds`.`store_id`, `ds`.`station_no`, `dss`.* FROM `data_station` `ds`, `data_StationSetting` `dss` WHERE ds.`station_no` = '%s' AND ds.`store_id` = '%s' AND `ds`.`station_id` = `dss`.`station_id`;", $this->station_no, $this->store_id),
      );
   }

   private function isDataValid(){
      return ($this->employee_no && $this->employee_pass && preg_match('/^\w+$/', $this->employee_pass) && preg_match('/^\w+$/', $this->employee_no) && $this->store_id && $this->station_no) ? true : false;
   }

   private function getIP(){
      return (empty($_SERVER['HTTP_CLIENT_IP']))?(empty($_SERVER['HTTP_X_FORWARDED_FOR']))?$_SERVER['REMOTE_ADDR']:$_SERVER['HTTP_X_FORWARDED_FOR']:$_SERVER['HTTP_CLIENT_IP'];
   }
   
   public function getProperties(){
      return array(
         "device" => $this->device,
         "errormsg" => $this->errormsg
      );
   }
}

$auth = new login_class();
$flag = $auth->start();
$data = $auth->getProperties();
if($flag){
   if(preg_match('/iPad/i', $data['device'])){
      header("Location:./imain.php");
   }else{
       if(!preg_match('/Chrome/i', $_SERVER['HTTP_USER_AGENT'])){
         session_destroy();
         echo '<a href="http://www.google.com/chrome">請先下載Google Chrome瀏覽器</a>';
         exit;
      }
       
      //if($_REQUEST['Version']==='develop'){
         header("Location:./devmain.php");
         
      //}else{
         //header("Location:./main.php");
      //}
   }
}else{
   header("Location:./index.php?msg=".urlencode($data['errormsg']));
}

?>