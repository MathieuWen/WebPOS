<?php
	header("Content-Type:text/javascript; charset=utf-8");
	define('DS', DIRECTORY_SEPARATOR);
	if(!defined('_ZDEFINES')) {
		define('ZPATH_BASE', str_replace('/includes/js/dev','', dirname(__FILE__)));
		require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
	} 
   require_once ZPATH_BASE.DS.'configuration.php';
	$CONFIG = new ZConfig();
   
   define('SQL_PATH', ZPATH_BASE.DS.'sql'.DS);
   
   function getContent($tableName){     
      $ch = curl_init();
      $options = array(CURLOPT_URL => '127.0.0.1/zpos/sql/table/createsql.php',
                     CURLOPT_HEADER => false,
                     CURLOPT_RETURNTRANSFER => true,
                     CURLOPT_USERAGENT => "ZDNPOS",
                     CURLOPT_FOLLOWLOCATION => true,
                     CURLOPT_POSTFIELDS=>'tableName='.$tableName
                 );
      curl_setopt_array($ch, $options);
      $output = curl_exec($ch);
      curl_close($ch);
      return $output;
   }
?>
var ZDBWorker = {
	Zdb : null,
	createsql : [],
	
	dropsql : ['DROP TABLE IF EXISTS ', 'update_temp', 'data_class', 'data_item', 'data_customer','data_table', 'sales_receipt', 'sales_receiptlist', 'sales_payment','data_brand','data_vender','data_remarklist','data_remarkassoc','data_remark','data_card','data_employee','sales_paydesc','trans_curid'],
	
	url : ['includes/php/replace.php'],	/*'+JSON.parse(localStorage.getItem('ZConfig')).store_id+'*/
	dropview : ['DROP VIEW IF EXISTS ', 'view_receivedOrder'],
	
	indexsql : [],
	
	viewsql :[],
	
	triggersql : [],

	drawSQL : {
		createsql : function (){     
			<?php
            $CreateTable = array( 'data_class', 'data_item', 'data_customer','data_table', 'sales_receipt', 'sales_receiptlist', 'sales_payment','data_brand','data_vender','data_remarklist','data_remarkassoc','data_remark','data_card','data_employee','sales_paydesc','trans_curid');
				$path = SQL_PATH.'table'.DS;
				$total_files = count($CreateTable);
				for ($i=0; $i<$total_files; $i++){
					echo "ZDBWorker.createsql.push('".str_replace(array("\r","\n","\t","\s"), '', getContent($CreateTable[$i]))."');\n";	
				}   
            echo "ZDBWorker.createsql.push('".str_replace(array("\r","\n","\t","\s"), '', file_get_contents($path.'update_temp.sql', FILE_USE_INCLUDE_PATH))."');\n";	
			?>
		},
		
		createurl : function(){
			//	data_class
			ZDBWorker.url.push('?tb=data_class&sql=SELECT%20*%20FROM%20data_class;');
			//	data_item
			ZDBWorker.url.push('?tb=data_item&sql=SELECT%20*%20FROM%20data_item;');
			//	data_customer
			ZDBWorker.url.push('?tb=data_customer&sql=SELECT%20*%20FROM%20data_customer;');
			//	data_brand
			ZDBWorker.url.push('?tb=data_brand&sql=SELECT%20*%20FROM%20data_brand;');
			//	data_vender
			ZDBWorker.url.push('?tb=data_vender&sql=SELECT%20*%20FROM%20data_vender;');
			//	data_remarklist
			ZDBWorker.url.push('?tb=data_remarklist&sql=SELECT%20*%20FROM%20data_remarklist;');
			//	data_remarkassoc
			ZDBWorker.url.push('?tb=data_remarkassoc&sql=SELECT%20*%20FROM%20data_remarkassoc%20WHERE%20remarkassoc_tbname="data_class";');
			//	data_remark
			ZDBWorker.url.push('?tb=data_remark&sql=SELECT%20*%20FROM%20data_remark');
			//	data_card
			ZDBWorker.url.push('?tb=data_card&sql=SELECT%20*%20FROM%20data_card;');
			//	data_employee
			ZDBWorker.url.push('?tb=data_employee&sql=SELECT%20*%20FROM%20data_employee;');
			//	sales_paydesc
			ZDBWorker.url.push('?tb=sales_paydesc&sql=SELECT%20paytype,paydescription%20FROM%20sales_paydesc%20WHERE%20sales_paydesc.show=1;');
			//	trans_curid
			ZDBWorker.url.push('?tb=trans_curid&sql=SELECT%20curid,curtype,curname%20FROM%20trans_curid;');
		},
		
		createtrigger : function()
		{
			<?php
				$path = SQL_PATH.'trigger'.DS;
				$files = glob($path.'{*.sql}', GLOB_BRACE | GLOB_NOSORT);
				$total_files = count($files);
				for ($i=0; $i<$total_files; $i++){
					echo "\t\t\t".'//'.str_replace($path,'',$files[$i])."\n\t\t\t";
					echo "ZDBWorker.triggersql.push('".str_replace(array("\r","\n","\t","\s"), '', file_get_contents($files[$i]) )."');\n";	
				}
			?>
		},
		
		createindex : function()
		{
			<?php
				$path = SQL_PATH.'index'.DS;
				$files = glob($path.'{*.sql}', GLOB_BRACE | GLOB_NOSORT);
				$total_files = count($files);
				for ($i=0; $i<$total_files; $i++){
					echo "\t\t\t".'//'.str_replace($path,'',$files[$i])."\n\t\t\t";
					echo "ZDBWorker.indexsql.push('".str_replace(array("\r","\n","\t","\s"), '', file_get_contents($files[$i]) )."');\n";	
				}
			?>
		},		
		
		createview : function()
		{
			<?php
				$path = SQL_PATH.'view'.DS;
				$files = glob($path.'{*.sql}', GLOB_BRACE | GLOB_NOSORT);
				$total_files = count($files);
				for ($i=0; $i<$total_files; $i++){
					echo "\t\t\t".'//'.str_replace($path,'',$files[$i])."\n\t\t\t";
					echo "ZDBWorker.viewsql.push('".str_replace(array("\r","\n","\t","\s"), '', file_get_contents($files[$i]) )."');\n";	
				}
			?>
		},
		
		work : function(){
			this.createsql();
			this.createurl();
			this.createtrigger();
			this.createview();
			this.createindex();
		},
		
		end_of_drawSQL : 0
	},
	
	start : function()
	{
			this.drawSQL.work();	
			this.initial();
			
			this.dropTable();
			
			this.createTable();
			this.createView();
			this.createIndex();
			this.createtrigger();
			this.downLoad();
			
	},
	
	initial : function()
	{
		try{
			//this.Zdb = self.openDatabase('zpos', '1.0', "ZDNPOS", 1024*512);
			this.Zdb = self.openDatabaseSync('zpos', '1.0', "ZDNPOS", 1024*512);
		}catch(err){
			throw new Error(err.message);
		}
	},
	
	createTable: function()
	{
		try {
			if(this.Zdb){
				this.Zdb.transaction(function(tx){
					length = ZDBWorker.createsql.length;
					for(var i = j = 0; i<length; i++){      
						tx.executeSql(ZDBWorker.createsql[i-0], null, function(ty, resultSet){
							ZDBWorker.Zmsg('建立[' +ZDBWorker.dropsql[++j]+'] 表');
						}, function(){
							ZDBWorker.Zmsg('error:WebDB, 建立`'+ZDBWorker.dropsql[++j]+'`表失敗');
						});
                  
					}
					i = j = null;
				});
			}else{
				this.Zmsg('存取資料庫');
			}
		}catch(err){
			this.Zmsg(err.message);
		}
	},	
	
	createView: function()
	{
		try {
			if(this.Zdb){
				this.Zdb.transaction(function(tx)
				{
					for(var i = 1, length = ZDBWorker.dropview.length;i<length; i++){
						tx.executeSql(ZDBWorker.dropview[0]+ZDBWorker.dropview[i-0]);
					}
				});
				
				this.Zdb.transaction(function(tx)
				{
					for(var i = 0, length = ZDBWorker.viewsql.length;i<length; i++){
                  
						tx.executeSql(ZDBWorker.viewsql[i-0]);
					}
				});
				
			}else{
				this.Zmsg('存取資料庫');
			}
		}catch(err){
			this.Zmsg(err.message);
		}
	},
		
	createIndex: function()
	{
		try {
			if(this.Zdb){
				this.Zdb.transaction(function(tx)
				{
					for(var i = j = 0; i<ZDBWorker.indexsql.length; i++){
						tx.executeSql(ZDBWorker.indexsql[i], null, function(ty, resultSet){
							ZDBWorker.Zmsg('建立[' +ZDBWorker.indexsql[++j]+'] 表');
						}, function(){
							ZDBWorker.Zmsg('error:建立`'+ZDBWorker.indexsql[++j]+'`表失敗');
						});
					}
					i = j = null;
				});
			}else{
				this.Zmsg('error:WebDB, 存取資料庫');
			}
		}catch(err){
			this.Zmsg(err.message);
		}
	},

	createtrigger: function()
	{
		try {
			if(this.Zdb){
				this.Zdb.transaction(function(tx)
				{
					for(var i = j = 0; i<ZDBWorker.triggersql.length; i++){
						tx.executeSql(ZDBWorker.triggersql[i], null);
					}
					i = j = null;
				});
			}else{
				this.Zmsg('error:WebDB, 存取資料庫');
			}
		}catch(err){
			this.Zmsg('error:WebDB, 存取資料庫:'+err.message);
		}
	},
	
	dropTable : function()
	{
		try {
			if(this.Zdb){
				this.Zdb.transaction(function(trans)
				{
					for(var i = j =1; i<ZDBWorker.dropsql.length; i++){
						trans.executeSql(ZDBWorker.dropsql[0]+ZDBWorker.dropsql[i-0], null, function(ty, resultSet){
							ZDBWorker.Zmsg('刪除[' + ZDBWorker.dropsql[++j]+'] 表');
						}, function(ty, err){
							ZDBWorker.Zmsg('error:WebDB, '+err.message);
						});
					}
					i = j = null;
				});
			}else{
				this.Zmsg('error:WebDB, 存取資料庫錯誤');
			}
		}catch(err){
			this.Zmsg(err.message);
		}
	},
	
	get : function(url) 
	{
		try{
			var xhr = new XMLHttpRequest();
			xhr.open('GET', url, false);
			xhr.send();
			this.Zmsg(url);
			return xhr.responseText;
		}catch (e){
			this.Zmsg('error:AJAX, url:'+e.message);
			return false;
		}
		delete xhr;
		url = null;
	},
	
	downLoad : function()
	{
		try{
			if (this.Zdb){
				this.Zdb.transaction(function(tx)
				{
					for(var k=1; k <ZDBWorker.url.length; k++){
						var surl = '<?=$CONFIG->fileroot;?>'+ZDBWorker.url[0] + ZDBWorker.url[k];
						var obj = ZDBWorker.get(surl);
						if(!obj) return false;
						eval("postMessage(obj)");
						var data = eval(obj);
						var i = data.length-1;
						if(i !== 0) {
							//while(i--){
							for(var i = 0; data[i]!=-1; i++){
                     //eval("postMessage(data[i])");
								tx.executeSql(data[i], null, function(ty, resultSet){
									ZDBWorker.Zmsg('資料索引[' +resultSet.insertId+'] 新增');
								}, function(ty, err){
									ZDBWorker.Zmsg('error:下載資料錯誤, '+err.message);
								});
							}
							delete data, obj;
							surl = i = null;
						}
						
					}
					
				});
				
			}else{
				this.Zmsg('error:WebDB, 存取資料庫錯誤');
			}
		}catch(err){
			this.Zmsg('error:WebDB, 存取資料庫錯誤, '+err.message);
		}
	},
	
	Zmsg : function(pretxt)
	{
		postMessage(pretxt);
		pretxt = null;
	}
}


onmessage = function(event){


	ZDBWorker.start();
   postMessage('end');

}