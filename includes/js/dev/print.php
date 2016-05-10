<?php
	header("Content-Type:text/javascript; charset=utf-8");
	define('DS', DIRECTORY_SEPARATOR);
	if(!defined('_ZDEFINES')) {
		define('ZPATH_BASE', str_replace(DS.'includes'.DS.'js'.DS.'dev','', dirname(__FILE__)));
		require_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
	} 
   require_once ZPATH_BASE.DS.'configuration.php';
	$CONFIG = new ZConfig();
?>
var dirver = function(posObj){
   var self = this;
   self.Config = {};
   (function(){
      self.Config = JSON.parse(  localStorage.getItem('ZConfig') );
      self.Device = JSON.parse(  localStorage.getItem('device') );
      self.invoicing = {};
      self.printer = {};
      self.casher = {};
      
      if(self.Device){
         $.each(self.Device, function(key, val){
            
            try{
               if(!empty(val.active)){
                  var deviceuid = uniqid(val.device_type);
                  self[val.device_type][deviceuid] = val;
                  $('<iframe/>').attr({
                     'id' : deviceuid,
                     'name' : deviceuid,
                     'src' : 'http://'+val.device_location+'/'+val.device_type+'.php',
                     'style' : 'display:none;'
                  }).appendTo('body');
               }
            }catch(e){
               console.log(e);
            }
         });
      }
   })();
   
   self.Ulpad = function(val, len){
      return str_pad((new String()).concat(val), len, '_', 'STR_PAD_LEFT');
   }
   
   self.Urpad = function(val, len){
      return str_pad((new String()).concat(val), len, '_', 'STR_PAD_RIGHT');
   }
   
   self.LenMax = function(){
      var arr = [], key;
      for(key in arguments){
         arr.push(arguments[key].toString(10).length);
      }
      return Max(arr);
   }
 
   self.prowill = function(parameter){
      var sales_detail = parameter.txt.replace(/{(sales_detail)[\s\S]*?\/\1}/gi, function(){
         var pre = arguments[1];
         var content = arguments[0].replace(new RegExp('{(\/|'+pre+')*}|\n', 'gi'), '');
         var detail = [], tmp='';
         for(var key in posObj.orderlist){
            if(posObj.orderlist.hasOwnProperty(key)){
               var itemProp = posObj.orderlist[key].getproperties();
               var itemisPrinted = itemProp.isprinted.toInt();
               if(itemisPrinted===0 || parameter.val.flag_PrintOnPrinted.toBool() && itemisPrinted.toBin().pickbinary(window.STATUSTHERMALPRINTED).toBool()){
                  var item_name = itemProp.name;
                  tmp = multiplereplace(content.replace(/{saleslist_name\:(\d{1,})}/gi, function(){
                     var maxLn = arguments[1].toInt();
                     return (item_name.length>maxLn)? item_name.substr(0, maxLn-3).concat('...'): item_name;
                  }),{
                     '{saleslist_quantity}': self.Ulpad(itemProp.saleslist_quantity, 3),  //	數量
                     '{saleprice}': self.Ulpad(itemProp.saleprice, 5),  //	價錢
                     '{saleslist_amount}': self.Ulpad(itemProp.saleslist_amount, 5) //	總額
                  });    
                  detail.push(tmp);
                  posObj.orderlist[key].alterPrintstatus(window.STATUSTHERMALPRINTED);
               }
            }
         }
         return detail.join('\n');
      });
      
      try{
         window.frames[parameter.key].postMessage(JSON.stringify({
            'type':parameter.val.device_name, 'content':sales_detail
         }), "*");
      }catch(e){
         console.log('無安裝列印程式');
      }finally{
         console.log('Thermal_Printer[prowill]:\n'+sales_detail);
      }
   }
 
   self.signalprowill = function(parameter){
      var orderlist = posObj.orderlist;
      for(var key in orderlist){
         if(orderlist.hasOwnProperty(key)){
            var itemProp = orderlist[key].getproperties();
            var itemisPrinted = itemProp.isprinted.toInt();
            if(itemisPrinted===0 || parameter.val.flag_PrintOnPrinted.toBool() && itemisPrinted.toBin().pickbinary(window.STATUSTHERMALPRINTED).toBool()){
               for(var i = itemProp.saleslist_quantity.toInt(); i>0; i--){
                  var sales_detail = parameter.txt.replace(/{(sales_detail)[\s\S]*?\/\1}/gi, function(){
                     var pre = arguments[1];
                     var content = arguments[0].replace(new RegExp('{(\/|'+pre+')*}|\n', 'gi'), '');
                     var detail = [], tmp='';
                     var item_name = itemProp.name;
                     
                     return tmp = multiplereplace(content.replace(/{saleslist_name\:(\d{1,})}/gi, function(){
                        var maxLn = arguments[1].toInt();
                        return (item_name.length>maxLn)? item_name.substr(0, maxLn-3).concat('...'): item_name;
                     }),{
                        '{saleslist_quantity}': 1,  //	數量
                        '{saleprice}': self.Ulpad(itemProp.saleprice, 5),  //	價錢
                        '{saleslist_amount}': self.Ulpad(itemProp.saleprice, 5) //	總額
                     });
                  });

                  try{
                     window.frames[parameter.key].postMessage(JSON.stringify({
                        'type':parameter.val.device_name, 'content':sales_detail
                     }), "*");
                  }catch(e){
                     console.log('無安裝列印程式');
                  }finally{
                     console.log('Thermal_Printer[signalprowill]:\n'+sales_detail);
                  }
               }
               posObj.orderlist[key].alterPrintstatus(window.STATUSTHERMALPRINTED);
            }
         }
      }
   }
 
   self.listprowill = function(parameter){
      var orderlist = posObj.orderlist;
      for(var key in orderlist){
         if(orderlist.hasOwnProperty(key)){
            var itemProp = orderlist[key].getproperties();    
            var itemisPrinted = itemProp.isprinted.toInt();
            if(itemisPrinted===0 || parameter.val.flag_PrintOnPrinted.toBool() && itemisPrinted.toBin().pickbinary(window.STATUSTHERMALPRINTED).toBool()){
               var sales_detail = parameter.txt.replace(/{(sales_detail)[\s\S]*?\/\1}/gi, function(){
                  var pre = arguments[1];
                  var content = arguments[0].replace(new RegExp('{(\/|'+pre+')*}|\n', 'gi'), '');
                  var detail = [], tmp='';
                  var item_name = itemProp.name;
                  
                  return tmp = multiplereplace(content.replace(/{saleslist_name\:(\d{1,})}/gi, function(){
                     var maxLn = arguments[1].toInt();
                     return (item_name.length>maxLn)? item_name.substr(0, maxLn-3).concat('...'): item_name;
                  }),{
                     '{saleslist_quantity}': self.Ulpad(itemProp.saleslist_quantity, 3),  //	數量
                     '{saleprice}': self.Ulpad(itemProp.saleprice, 5),  //	價錢
                     '{saleslist_amount}': self.Ulpad(itemProp.saleslist_amount, 5) //	總額
                  });
               });

               try{
                  window.frames[parameter.key].postMessage(JSON.stringify({
                     'type':parameter.val.device_name, 'content':sales_detail
                  }), "*");
               }catch(e){
                  console.log('無安裝列印程式');
               }finally{
                  console.log('Thermal_Printer[listprowill]:\n'+sales_detail);
               }
               posObj.orderlist[key].alterPrintstatus(window.STATUSTHERMALPRINTED);
            }
         }
      }
   }

 
	self.Thermal_toPrint = function(systemStatus){
      systemStatus = systemStatus || window.STATUSCHECKOUT;
      if(!Object.size(self.printer))   return;
      var that = this;
      var employee = JSON.parse(  sessionStorage.getItem('employee') );
      var customer = JSON.parse(  sessionStorage.getItem('customer') );
      var table = JSON.parse(  sessionStorage.getItem('table') );
      var sales_no = sessionStorage.getItem('sales_no');
      var customer_name = (customer && customer.name) || '';     
      var summProp = posObj[!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)?'subsumm':'summ'].getproperties();
      var sales_amount = summProp.sales_amount;
      var sales_cash = posObj.paylist[window.PAYBYCASH] && posObj.paylist[window.PAYBYCASH].getproperties().paymentlist_amount || 0;
      var sales_remainder = sales_cash-sales_amount || 0;
      var display = posObj.displayEntyies();
      
      var maxth =  self.LenMax(sales_amount, sales_cash, sales_remainder);
      
      var common = function(template){
         return multiplereplace($('#'+template).val(), {
            '{title}': self.Config.prowill_title,
            '{customer_name}': customer_name,
            '{customer_point}': display.point,
            '{customer_total}': sessionStorage.getItem('customer_total'),
            '{customer_deposit}': display.deposit,
            '{table_name}': table.no,
            '{sales_discount}': display.addition_discount,
            '{sales_amount}': self.Ulpad(sales_amount, maxth),
            '{sales_subtotal}': self.Ulpad(sales_amount, maxth),
            '{sales_allowance}': display.addition_allowance,
            '{sales_plus}': display.addition_service,
            '{sales_cash}': self.Ulpad(sales_cash, maxth),
            '{sales_remainder}': self.Ulpad(sales_remainder, maxth),
            '{user_name}': employee.name,
            '{sales_total}': summProp.sales_total
            
         }).replace(/{sales_no_pre\:(\d{1,})}/gi, function(){
            return sales_no.substr(0,  arguments[1].toInt());
            
         }).replace(/{sales_no_aft\:(\d{1,})}/gi, function(){
            var len = arguments[1].toInt();
            return sales_no.substr(sales_no.length-len, len);
            
         }).replace(/\/(\*)[\s\S]*?\1\//gi, '');
      }
       
      $.each(self.printer, function(key, val){
         switch(systemStatus){
            case window.STATUSRECEIVEDORDER:
               if(!val.flag_PrintOnReceived.toBool()) return;
            break;
            case window.STATUSCHECKOUT:
               if(!val.flag_PrintOnCheckOut.toBool()) return;
            break;
            case window.STATUSCHECKING:
               if(!val.flag_PrintOnChecking.toBool()) return;
            break;
         }
         
         if(!val.flag_PrintOnPrinted.toBool()){
            var orderlist = posObj.orderlist, flag = true;
            for(var key in orderlist){
               if(orderlist.hasOwnProperty(key)){
                  var itemisPrinted = orderlist[key].getproperties().isprinted.toInt();
                  flag &= itemisPrinted.toBin().pickbinary(window.STATUSTHERMALPRINTED).toBool();
               }
            }
            if(flag)   return;
         }
         
         self[val.print_template]({'key':key, 'val':val, 'txt':common(val.print_template)});
      });
	}
	
	self.Casher_toOpen = function(){
      try{
         window.frames['printer'].postMessage('#cash', "*");
      }catch(e){
         window.frames['invoicing'].postMessage('#cash', "*");
      }
	}

   
 
   self.receipt = function(parameter){
      var sales_detail = parameter.txt.replace(/{(sales_detail)[\s\S]*?\/\1}/gi, function(){
         var pre = arguments[1];
         var content = arguments[0].replace(new RegExp('{(\/|'+pre+')*}|\n', 'gi'), '');
         var detail = [], tmp='', key;
         var orderlist = posObj.orderlist;
         for(key in orderlist){
            if(orderlist.hasOwnProperty(key)){
               var itemProp = orderlist[key].getproperties();
               var itemisPrinted = itemProp.isprinted.toInt();
               if(itemisPrinted===0 || parameter.val.flag_PrintOnPrinted.toBool() && itemisPrinted.toBin().pickbinary(window.STATUSTHERMALPRINTED).toBool()){
                  var item_name = itemProp.name;
                  tmp = multiplereplace(content.replace(/{saleslist_name\:(\d{1,})}/gi, function(){
                     var maxLn = arguments[1].toInt();				 
                     item_name = (item_name.Bytelength()>maxLn)? item_name.substr(0, maxLn-6).concat('‧‧‧'): item_name;
                     var max = (arguments[1].toInt()-item_name.Bytelength());
                     return item_name+addchar(max, '_');
                  }),{
                     '{saleslist_quantity}': self.Ulpad(itemProp.saleslist_quantity.toInt(), 3),
                     '{saleprice}': self.Ulpad(itemProp.saleprice.toInt(), 5),
                     '{saleslist_amount}': self.Ulpad(itemProp.saleslist_amount.toInt().toString().concat((empty(itemProp.saleslist_exemption)?'TX':'')), 5)
                  }); 
                  detail.push(tmp);
                  
                  orderlist[key].alterPrintstatus(window.STATUSRECEIPTPRINTED);
               }
            }
         }
         
         return detail.join('\n');
      });	
      
      try{
         window.frames[parameter.key].postMessage(JSON.stringify({
            'type':parameter.val.device_name, 'content':sales_detail
         }), "*");
      }catch(e){
         console.log('無安裝列印程式');
      }finally{
         console.log('Receipt_toPrint[receipt]:\n'+sales_detail);
      }
   }

	self.Receipt_toPrint = function(systemStatus){
      systemStatus = systemStatus || window.STATUSCHECKOUT;
      if(!Object.size(self.invoicing))   return;
      
      var store = JSON.parse(  localStorage.getItem('store') );
      var employee = JSON.parse(  sessionStorage.getItem('employee') );
      var customer = JSON.parse(  sessionStorage.getItem('customer') );
      var table = JSON.parse(  sessionStorage.getItem('table') );
      var sales_no = sessionStorage.getItem('sales_no');
      var customer_name = (customer && customer.name) || '';
      var summProp = posObj[!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)?'subsumm':'summ'].getproperties();
      var sales_amount = summProp.sales_amount;

      var sales_cash = posObj.paylist[window.PAYBYCASH] && posObj.paylist[window.PAYBYCASH].getproperties().paymentlist_amount || 0;

      var sales_remainder = sales_cash-sales_amount || 0;
      var maxth =  self.LenMax(sales_amount, sales_cash, sales_remainder);
      
      var common = function(template){
         return multiplereplace($('#'+template).val(), {
            '{comptitle}': store.store_name,
            '{comptaxid}': store.store_taxid,
            '{compaddr}': store.store_address,
            '{compphone}': store.store_tel,
            '{store_no}': self.Config.store_id,
            '{station_no}': self.Config.station_no,
            '{sales_no}': sales_no,
            '{sales_total}': self.Ulpad(summProp.sales_total, 4),
            '{sales_amount}': self.Ulpad(sales_amount, maxth),
            '{sales_subtotal}': self.Ulpad(sales_amount, maxth),
            '{sales_allowance}': display.addition_allowance,
            '{sales_plus}': display.addition_service,
            '{sales_cash}': self.Ulpad(sales_cash, maxth),
            '{sales_remainder}': self.Ulpad(sales_remainder, maxth),
            '{user_name}': employee.name
         }).replace(/\/(\*)[\s\S]*?\1\//gi, '');
      }
 
      $.each(self.invoicing, function(key, val){
         switch(systemStatus){
            case window.STATUSRECEIVEDORDER:
               if(!val.flag_PrintOnReceived.toBool()) return;
            break;
            case window.STATUSCHECKOUT:
               if(!val.flag_PrintOnCheckOut.toBool()) return;
            break;
            case window.STATUSCHECKING:
               if(!val.flag_PrintOnChecking.toBool()) return;
            break;
         }
         
         if(!val.flag_PrintOnPrinted.toBool()){
            var orderlist = posObj.orderlist, flag = true;
            for(var key in orderlist){
               if(orderlist.hasOwnProperty(key)){
                  var itemisPrinted = orderlist[key].getproperties().isprinted.toInt();
                  //console.log(itemisPrinted, itemisPrinted.toBin().pickbinary(window.STATUSRECEIPTPRINTED).toBool(), orderlist[key].getproperties());
                  flag &= itemisPrinted.toBin().pickbinary(window.STATUSRECEIPTPRINTED).toBool();
               }
            }
            if(flag)   return;
         }
         self[val.print_template]({'key':key, 'val':val, 'txt':common(val.print_template)});
         
         
      });
	}
}