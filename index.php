<?php
header("Content-type: text/html; charset=utf-8");
define('DS', DIRECTORY_SEPARATOR);
if(!defined('_ZDEFINES')) {
   define('ZPATH_BASE', dirname(__FILE__));
   require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
}
require_once 'configuration.php';
require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
$CONFIG = new ZConfig();
$ZDB = new ZDatabase();
?>
<!DOCTYPE html>
<html lang="zh-tw">
<head> 
<meta charset="UTF-8">
<title><?=$CONFIG->sitename?></title>
<link rel="shortcut icon" href="favicon.ico"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" href="themes/reset-min.css" type="text/css" />
<link rel="stylesheet" href="themes/index.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_PLUGINS;?>js/jquery.ui-dev-1.8.16/jquery.ui.custom.css" type="text/css" />
<link rel="stylesheet" href="<?=ZDIR_PLUGINS;?>js/jquery.keyboard/keyboard.css" type="text/css" />
<script type="text/javascript" src="<?=ZDIR_LIBRARIES;?>js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="<?=ZDIR_PLUGINS;?>js/jquery.keyboard/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?=ZDIR_PLUGINS;?>js/jquery.keyboard/jquery.keyboard.js"></script>
<script type="text/javascript" src="<?=ZDIR_PLUGINS;?>js/jquery.keyboard/jquery.keyboard.extension-typing.js"></script>
<script type="text/javascript">
<?php
   echo 'var station = '.json_encode($ZDB->Zquery("SELECT `store_id`, `station_no` FROM `data_station` WHERE 1;")).';';
   if(isset($_REQUEST['msg'])){
      echo "setTimeout(function(){alert('{$_REQUEST['msg']}');},1000);";
   }
   
?>

function before_submit(){
   $('#store_id, #station_no').prop('disabled', false);
	localStorage.store_id = $('#store_id').val();
	localStorage.station_no = $('#station_no').val();
	$('#form1').submit();
	return true;
}

function queryStation(){
   $('option', $('#station_no')).remove();
   var store = $('#store_id').val();
   $.each(station, function(key, val){
      if(val.store_id===store){
         $('<option/>').text(val.station_no).val(val.station_no).appendTo('#station_no');
      }
   });
}

$(window).ready(function(){
   if(typeof localStorage.store_id !=='undefined' || localStorage.store_id!==''){
      $('#store_id').val(localStorage.store_id);
   }   
   if(typeof localStorage.station_no !=='undefined' || localStorage.station_no!==''){
      queryStation();
      //$('#station_no').val(localStorage.station_no).prop('disabled', true);
   }
   
   $('#station_no').focus(function(){
      queryStation();
   });
   
   $('#device').val(navigator.userAgent);

   
   $('#username').keyboard({
      layout   : 'ZDN'
   }).addTyping();
 
 
   $('#userpass').keyboard({ 
      openOn : null,
      layout : 'ZDN'
    }).addTyping();
    
   $('#userpass').click(function(){
      $('#userpass').getkeyboard().reveal();
   });


});

</script>
</head>

<body onselectstart ="return false;" oncontextmenu="window.event.returnValue=false;" style="ime-mode:disabled;">
<table>
<tr><td>
<section>
            <form id="form1" name="form1" enctype="multipart/form-data" method="post" action="authenticate.php" onsubmit="return before_submit();">
                <div id="box">
                    <div id="login">
                        <img src="media/login/loginlogo.gif" alt="Login"/>
                        <table cellpadding="0" cellspacing="0">
                        	<tr>
                            	<td valign="top" align="right"><label for="username">ID NUMBER 帳號：</label></td>
                                <td valign="top" align="right">
                                    <input type="text" id="username" name="username" tabindex="1" required="required"/>
                                </td>
                                <td rowspan="3" valign="top">
                                    <input type="image" src="media/login/login.jpg" value="Submit" alt="確定登入" title="確定登入" tabindex="5"/>
                                </td>
                            </tr>
                            <tr>
                            	<td valign="top" align="right"><label for="userpass">PASSWORD 密碼：</label></td>
                                <td valign="top" align="right">
                                    <input type="password" id="userpass" name="userpass" tabindex="2" required="required"/>
                                </td>
                            </tr>
						<tr>
							<td valign="top" align="right"><label for="store_id">STORE 店別：</label></td>
							<td valign="top" align="right">
								<select id="store_id" name="store_id" tabindex="3">
									<?php
										$result = $ZDB->Zquery("SELECT `store_id`, `store_name` FROM `data_store` WHERE 1;");
										if($result){
											foreach($result as $key => $val){
												echo "<option value=\"{$val['store_id']}\">{$val['store_name']}</option>";
											}
										}
									?>
								</select>
								
							</td>
						</tr>
                            <tr>
							<td valign="top" align="right"><label for="station_no">machine 機號：</label></td>
							<td valign="top" align="right">
								<select id="station_no" name="station_no" tabindex="4"></select>
								<input  type="hidden" name="device" id="device" value=""/>
							</td>
                            </tr>						
						</table>
                    </div>
                    
                	<footer>POWERED BY ZDN COPYRIGHT &copy; ALL RIGHTS RESERVED</footer>
                </div>
			</form>
</section>
</td></tr>
</table>
</body>
</html>
<?php

/* if(!empty($_REQUEST['ssid']) || isset($_REQUEST['ssid'])){
    $ZDB->execute("DELETE FROM `sessions` WHERE `sesskey` = '{$_REQUEST['ssid']}';");
} */
?>