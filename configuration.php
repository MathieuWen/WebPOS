<?php
/*	檔名：configuration.php
 *	用處：定義所需之參數 
 *	建構者：Asda
 */
class ZConfig {
	public $offline                               = '0';
	public $offline_message           							= '此系統進行維護中。';
	public $sitename					    											='ZPOS';
	public $siteip																				='192.168.2.253';
	public $fileroot								=	'/zpos/';
	public $socketport						='12345';
	public $dbtype						    = 'mysqli';
	public $db_host                            = 'localhost';	
	public $db_database              	= 'conductor';
	public $db_user                          	= 'root';	
	public $db_password               	= 'zdn';
   
   function __construct()
   {
      date_default_timezone_set('Asia/Taipei');
   }
}
?>