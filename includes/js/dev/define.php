<?php
	header("Content-Type:text/javascript; charset=utf-8");
	define('DS', DIRECTORY_SEPARATOR);
	if(!defined('_ZDEFINES')) {
		define('ZPATH_BASE', str_replace(DS.'includes'.DS.'js'.DS.'dev','', dirname(__FILE__)));
		require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
	} 
   require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
   require_once ZPATH_BASE.DS.'configuration.php';
   
	$CONFIG = new ZConfig();
   $ZDB = new ZDatabase();
   $system_status = $ZDB->Zquery("SELECT UCASE(`status_name`) AS `name`, `status_no` AS `no` FROM `system_status` WHERE `status_name` IS NOT NULL;");
   foreach($system_status as $system_status_val){
      echo "define('{$system_status_val['name']}', '{$system_status_val['no']}');\n";
   }
   $payment = $ZDB->Zquery("SELECT UCASE(`payment_name`) AS `name`, `payno` AS `no` FROM `data_payment` WHERE `system` = 1 AND `payment_name` IS NOT NULL;");
   foreach($payment as $payment_val){
      echo "define('{$payment_val['name']}', '{$payment_val['no']}');\n";
   }
   $paydefiend = $ZDB->Zquery("SELECT UCASE(`payname`) AS `name`, `paytype` AS `no` FROM `data_paydesc` WHERE `payname` IS NOT NULL;");
   foreach($paydefiend as $paydefiend_val){
      echo "define('{$paydefiend_val['name']}', '{$paydefiend_val['no']}');\n";
   }
   
?>
define('STATUSTHERMALPRINTED', '1');
define('STATUSRECEIPTPRINTED', '2');
define('STATUSBOTHPRINTED', '3');
define('RESTURL', '<?=ZDIR_INCLUDES;?>php/iquery.php');
define('SERVERTIMEURL', '<?=ZDIR_INCLUDES;?>php/serverSent.php');
define('TABLELISTURL', 'tablelist.php');
define('JSMODELURL', '<?=ZDIR_INCLUDES;?>js/dev/model/');
define('JSINCLUDESURL', '<?=ZDIR_INCLUDES;?>js/dev/');
define('GUARDURL', '<?=ZDIR_GUARD;?>cardsetting.php');
define('DATABASEINITERDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/databaseIniter.js');
define('DATABASEDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/database.js');
define('BUTTONCTRLDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/buttonCtrl.js');
define('CLASSDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/class.js');
define('DEBITNOTEDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/debitnote.js');
define('DISANNULNOTEDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/disannulnote.js');
define('DEFINEDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/define.php');
define('DISPLAYDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/display.js');
define('INDEXDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/index.js');
define('ITEMDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/item.js');
define('SPECIALSALESDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/specialsales.js');
define('PAYPALDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/paypal.js');
define('PRINTDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/print.php');
define('SUMMARYDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/summary.js');
define('SUBSUMMARYDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/subsummary.js');
define('ZPOSDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/zpos.js');
define('DATADOTJS', '<?=ZDIR_INCLUDES;?>js/dev/data.js');
define('MODEL_VIEW_SPECIALSALESDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/view_SpecialSales.js');
define('MODEL_DATA_CLASSDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/data_class.js');
define('MODEL_DATA_CUSTOMERDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/data_customer.js');
define('MODEL_DATA_ITEMDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/data_item.js');
define('MODEL_SALES_PREPAIDDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/sales_prepaid.js');
define('MODEL_SALES_RECEIPTDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/sales_receipt.js');
define('MODEL_SALES_RECEIPTLISTDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/sales_receiptlist.js');
define('MODEL_SALES_PAYMENTDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/sales_payment.js');
define('MODEL_SALES_PAYMENTLISTDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/sales_paymentlist.js');
define('MODEL_DATA_EMPLOYEEDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/data_employee.js');
define('MODEL_DATA_TABLEDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/data_table.js');
define('MODEL_PROGRAM_DEFINITIONDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/program_definition.js');
define('MODEL_VIEW_PAYDEFINEDDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/view_paydefined.js');
define('MODEL_VIEW_PROGRAM_ASSOCDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/view_program_assoc.js');
define('MODEL_VIEW_REMARK_ASSOCDOTJS', '<?=ZDIR_INCLUDES;?>js/dev/model/view_remark_assoc.js');
