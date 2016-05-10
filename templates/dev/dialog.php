<?php
   $sql = "SELECT DISTINCT `location`, `store_id` AS `store` FROM data_table WHERE store_id = '{$_SESSION['store_id']}' ORDER BY `usrno` ASC;";
   $result = $ZDB -> Zquery($sql);
?>
<div id='dialogTable' title='' data-url='<?=json_encode($result);?>' class="tabs-bottom">
   <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
      <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
<?php
	  if($result){
      $i=0;
      foreach($result as $val){
         echo "<li><a id='tablelist".($i++)."' href='tablelist.php?location=".md5($val['location'])."&store_id=".urlencode($val['store'])."&station_no=".urlencode($_SESSION['station_no'])."'>{$val['location']}</a></li>";
      }
	  }else{
         echo "<li><a href='tablelist.php?location=&store_id=".urlencode($val['store'])."&station_no=".urlencode($_SESSION['station_no'])."'>預設</a></li>";
	  }
?>
      </ul>
   </div>
</div>