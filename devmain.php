<?php 
header("Content-type: text/html; charset=utf-8");
define('DS', DIRECTORY_SEPARATOR);
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', dirname(__FILE__));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
}
require_once 'configuration.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
include_once ZPATH_LIBRARIES . DS . 'php' . DS . 'class.session.php';
/*
if(empty($_SESSION['emp_no'])){
   header("Location:./index.php?msg=".urlencode('操作已逾時, 請重新登入'));
}*/
$CONFIG = new ZConfig();
$ZDB = new ZDatabase();
//  manifest="ZPOS.manifest"
?>
<!DOCTYPE html>
<html lang="zh-tw">
<head> 
<meta charset="UTF-8">
<title><?=$CONFIG->sitename;?></title>
<link rel="shortcut icon" href="favicon.ico"/>
<script>
<?php
echo "localStorage.setItem('ZConfig', '".utf8_decode($_SESSION['StationSetting'])."');\n";
echo "localStorage.setItem('station', '".utf8_decode($_SESSION['station'])."');\n";
echo "localStorage.setItem('device', '".utf8_decode($_SESSION['device'])."');\n";
echo "localStorage.setItem('store', '".utf8_decode($_SESSION['store'])."');\n";
echo "sessionStorage.setItem('employee', '".utf8_decode($_SESSION['employee'])."');\n";

$sql = "SELECT MAX(`sales_no`)+1 FROM `sales_receipt` WHERE `store_id` = {$_SESSION['store_id']} AND `station_no` = '{$_SESSION['station_no']}' ORDER BY `sales_no` DESC LIMIT 1;";
$sales_no	= $ZDB->ZquerySingle($sql);
if($sales_no=='-1'|| empty($sales_no))	$sales_no = '00000001';
else $sales_no = str_pad($sales_no, 8, "0", STR_PAD_LEFT);
echo "localStorage.setItem('sales_no', '". $sales_no."');\n";

$status = $ZDB->Zquery("SELECT * FROM system_status ORDER BY `ordering` DESC;");
echo "localStorage.setItem('system_status', '". json_encode($status, JSON_NUMERIC_CHECK)."');\n";
?>
</script>
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>reset-min.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_PLUGINS;?>js/jquery.ui-dev-1.8.16/jquery.ui.custom.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>dev/display.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>dev/dialog.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>dev/style.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>dev/order_list.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>dev/left_bottom.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_THEMES;?>dev/login.css" type="text/css" />
<script type="text/javascript" src="<?=ZDIR_LIBRARIES;?>js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<?=ZDIR_LIBRARIES;?>js/jquery.md5.js"></script>
<script type="text/javascript" src="<?=ZDIR_LIBRARIES;?>js/jquery.sha256.js"></script>
<?php
$path = ZDIR_PLUGINS.'js'.DS.'jquery.ui-dev-1.8.16'.DS;
$files = glob($path.'{*.js}', GLOB_BRACE );
$total_files = count($files);
 for($i=0; $i<$total_files; $i++){
	echo "<script type=\"text/javascript\" src=\"{$files[$i]}\"></script>\n";
} 
?>
<script type="text/javascript" src="<?=ZDIR_LIBRARIES;?>js/asda.libraries.js"></script>
<script type="text/javascript" src="<?=ZDIR_INCLUDES;?>js/dev/define.php"></script>
<script>
var Config = JSON.parse(localStorage.getItem('ZConfig'));

var loader = function(){
   var LoadCount = 0;
   
   var importJS = function(src) {
      try{
         var timestamp = (new Date()).getTime(), 
         script = document.createElement('script');
         script.setAttribute('async', false);
         script.setAttribute('type', 'text/javascript');
         script.setAttribute('src', src+'?'+timestamp);
         script.setAttribute('charset', 'utf-8');
         script.onload = function(){
            console.log('import:', src);
            $(document).dequeue("loadJS");
            LoadCount++;
         }
         script.onerror = function(){
            console.log(arguments);
         }

         var head = document.getElementsByTagName('head')[0];
         if (head) head.appendChild(script);
         else document.body.appendChild(script);
      }catch(e){
         console.log(e);
      }
   }
   
   $(document).queue("loadJS", [
      importJS(window.CLASSDOTJS),
      importJS(window.DATABASEDOTJS),
      importJS(window.ZPOSDOTJS),
      importJS(window.ITEMDOTJS),
      importJS(window.SUMMARYDOTJS),
      importJS(window.SUBSUMMARYDOTJS),
      importJS(window.PAYPALDOTJS),
      importJS(window.DISPLAYDOTJS),
      importJS(window.DEBITNOTEDOTJS),
      importJS(window.DISANNULNOTEDOTJS),
      importJS(window.DATADOTJS),
      importJS(window.SPECIALSALESDOTJS),
      importJS(window.MODEL_VIEW_SPECIALSALESDOTJS),
      importJS(window.MODEL_DATA_CLASSDOTJS),
      importJS(window.MODEL_DATA_CUSTOMERDOTJS),
      importJS(window.MODEL_DATA_ITEMDOTJS),
      importJS(window.MODEL_SALES_PREPAIDDOTJS),
      importJS(window.MODEL_SALES_RECEIPTDOTJS),
      importJS(window.MODEL_SALES_RECEIPTLISTDOTJS),
      importJS(window.MODEL_SALES_PAYMENTDOTJS),
      importJS(window.MODEL_SALES_PAYMENTLISTDOTJS),
      importJS(window.MODEL_DATA_EMPLOYEEDOTJS),
      importJS(window.MODEL_DATA_TABLEDOTJS),
      importJS(window.MODEL_PROGRAM_DEFINITIONDOTJS),
      importJS(window.MODEL_VIEW_PAYDEFINEDDOTJS),
      importJS(window.MODEL_VIEW_PROGRAM_ASSOCDOTJS),
      importJS(window.MODEL_VIEW_REMARK_ASSOCDOTJS),
      importJS(window.BUTTONCTRLDOTJS),
      importJS(window.PRINTDOTJS),
      importJS(window.INDEXDOTJS)
   ]);

   window.delayExecute(function(){
      return !$(document).queue("loadJS").length;
   },function(){
      window.pos.init();
      window.print = new dirver(jQuery.extend(window.pos, viewEntyies));
   }, 400);
}



if(window.navigator.onLine && Config.default_database==='local'){
		try{
			var Zworker = new Worker(window.DATABASEINITERDOTJS);
			Zworker.postMessage(1);
			Zworker.onmessage = function(event){
				var data = event.data;
				if(data==='end'){
               loader();
            }
			}
			Zworker.onerror = function(event){
				console.log("error:"+event.message+" in "+event.filename+" line:"+event.lineno);			
			}
		}catch(e){
			console.log('於'+e.lineno+' :'+e.message);
		}
}else if(window.navigator.onLine){
   loader();
}



</script>
</head>

<?php 
flush();
chmod(ZDIR_PRINT, 0777);
if(!file_exists(ZDIR_PRINT.$_SESSION['store_id'])){
   mkdir(ZDIR_PRINT.$_SESSION['store_id'], 0777, true);
}
sleep(0.5);

if(!(file_exists(ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'prowill')&&file_exists(ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'receipt'))){
   copy(ZPATH_PRINT.DS.'default'.DS.'prowill', ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'prowill');
   copy(ZPATH_PRINT.DS.'default'.DS.'receipt', ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'receipt');
}

sleep(0.5);
?>
<body onselectstart ="return false;" oncontextmenu="window.event.returnValue=false;" style="ime-mode:disabled;">
<table style="margin:0;padding:0;width:100%;height:100%;"><tr><td>
<?php include ZPATH_TEMPLATES. DS.'dev'.DS.'dialog.php'; ?>
<div id="container">

	
<?php include ZPATH_TEMPLATES. DS.'dev'.DS.'purchase_list.php'; ?>

<?php include ZPATH_TEMPLATES. DS.'dev'.DS.'item_list.php'; ?>


<textarea name="prowill" id="prowill" style="display:none;">
<?php include ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'prowill'; ?>
</textarea>
<textarea name="receipt" id="receipt" style="display:none;">
<?php include ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'receipt';?>
</textarea>
<textarea name="signalprowill" id="signalprowill" style="display:none;">
<?php include ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'signalprowill';?>
</textarea>
<textarea name="listprowill" id="listprowill" style="display:none;">
<?php include ZPATH_PRINT.DS.$_SESSION['store_id'].DS.'listprowill';?>
</textarea>
</div>
</td></tr>
</table>
</body>
</html>
<?php
	unset($CONFIG);
?>