var ua = navigator.userAgent, 
ievent = (ua.match(/iPad/i)) ? "click" : "click";

window.LoadScript = function(parameter){

   delayExecute(function(){
      try{
         $.getScript(window.JSMODELURL+parameter.className+'.js');
      }catch(err){
         $.getScript(window.JSINCLUDESURL+parameter.className+'.js');
      }
      console.log('LoadScript...'+parameter.className, (new Date()).getTime());
      return method_exists(parameter.className, parameter.method);
   },function(){
      if(!!parameter.callback){
         jQuery.globalEval(parameter.callback);
      }
   }, 400);
}

window.onerror = function(msg, url, line){
   console.log(msg, url, line, event, error_get_last());
   event.returnValue=false;
}

window.onbeforeunload = function(){
   window.pos.unlock();
   
   return '卸載作業完成';
}

$(document).ready(function(){
   
   ini_set('date.timezone', 'Asia/Taipei');
   error_reporting(1);
   
   $( "div#display_title" ).ajaxError(function(e, jqxhr, settings, exception) {
      //console.log(jqxhr);
      if(settings.dataType=='script'){
         $(this).text( "與遠端伺服器連線發生異常，請確保您的網路連線的品質" );
      }
   });
    
    if(!!window.EventSource){
        var source = new EventSource(window.SERVERTIMEURL);
        source.addEventListener('message', function(e){
            var data = JSON.parse(e.data);
            DOM.displayEntyies({
                time:data.now
               // employee:employee.employee_name
            });
            e = null;
        }, false);

        source.addEventListener('open', function(e) {
            //pos.init().purchaseStart();
            //window.pos.init();
        }, false);

        source.addEventListener('error', function(e) {
            if(e.readyState == EventSource.CLOSED) {
               DOM.displayEntyies({display_title:'無法讀取到伺服器時間，請重新刷新'});
            }else if(e.type==='error'){
               DOM.displayEntyies({display_title:'連線發生錯誤，請檢查您的網路連線'});
            }
        }, false);
        
        
      var tabs = null;
      serverFn = function(location, fn){
         var Config = JSON.parse(  localStorage.getItem('ZConfig') );
         var query = ['store_id='+Config.store_id, 'location='+location, 'event=serversent'];
         tabs = new EventSource(window.TABLELISTURL+'?'+query.join('&'));
         tabs.addEventListener('message', function(e){
            var data = JSON.parse(e.data);
            fn.apply({data:data.tabs});
                  var merge = JSON.parse(sessionStorage.getItem('mergeSales'));
                  for(var key in merge){
                     if(merge.hasOwnProperty(key)){
                        $('#'+key).addClass('merge');
                     }
                  }            
            
            e = null;
         }, false);              
      }
    }else{
     // window.pos.init();
        //  傳統ajax
    }
    
   $('#tabs div.lock').live('click', function(){
      var locker = $(this).attr('data-lock');
      var station = JSON.parse(  localStorage.getItem('station') );
      if(locker === station.station_no){
         window.pos.actionStart({
            id: $(this).attr('data-table'), 
            sales_no: $(this).attr('data-sales_no'), 
            station_no:$(this).attr('data-station_no')
         });
         if($(this).attr('class').indexOf('checking')>-1){
            sessionStorage.setItem('status', window.STATUSCHECKING);
         }
      }
   }); 

   $('#tabs div.table:not(div.lock)').live('click', function(){
      if($('#mergeCheck').val().toBool()){
         if($(this).data('sales_spk').toBool()){
            var obj = $(this), objid = obj.attr('id');
            var mergeObj = JSON.parse(sessionStorage.getItem('mergeSales'));
            if(mergeObj[objid]===undefined){
               mergeObj[objid] = {
                  sales_spk:obj.data('sales_spk'), 
                  table_id:obj.attr('data-table'), 
                  sales_no:obj.attr('data-sales_no'), 
                  station_no:obj.attr('data-station_no')
               };
            }else{
               delete mergeObj[objid];
            }
            sessionStorage.setItem('mergeSales', JSON.stringify(mergeObj));

            
            if( !$('#mergeActive').length && Object.size(mergeObj)>1  ){
               $('<button/>').attr('id', 'mergeActive').appendTo('div.controlPanel');
               $('#mergeActive').button({
                  icons: {primary: "ui-icon-wrench"},
                  label: "進行合併"
               });
            }else if($('#mergeActive').length&&Object.size(mergeObj)<2){
               $('#mergeActive').remove();
            }
         }
      }else{
         window.pos.actionStart({
            id: $(this).attr('data-table'), 
            sales_no: $(this).attr('data-sales_no'), 
            station_no:$(this).attr('data-station_no')
         });

         if($(this).attr('class').indexOf('checking')>-1){
            sessionStorage.setItem('status', window.STATUSCHECKING);
         }
      }
   });

   $('#mergeActive').live('click', function(){
      if(confirm('您確定要合併這些單據？\n※合併後就不可做拆單動作※')){
         var Config = JSON.parse(  localStorage.getItem('ZConfig') );
         var station = JSON.parse(  localStorage.getItem('station') );
         window.sales_receipt.lastestNo({
            store_id: Config.store_id,
            station_no: station.station_no
         }, function(){
            if(this.data){
               sessionStorage.setItem('sales_no', this.data.pop().lastestNo);
               window.sales_receiptlist.mergeStart();
               window.sales_payment.mergeStart();
               window.sales_paymentlist.mergeStart();
               var mergeData = window.sales_receipt.mergeStart();
               //console.log(mergeData);
               try{
                  window.delayExecute(function(){
                     return !empty(sessionStorage.getItem('sales_no')) && parseInt(sessionStorage.getItem('customer_total'), 10) > 1 && Object.size(mergeData);
                  },function(){
                     window.pos.actionStart({
                        id: mergeData.table_id, 
                        sales_no: sessionStorage.getItem('sales_no'), 
                        station_no: mergeData.station_no
                     });
                     
                    // $('#mergeCheck').siblings('label').remove();
                     $('#mergeCheck').button('refresh');
                     $('#mergeActive').remove();
                     sessionStorage.setItem('mergeSales', '{}');
                  });
               }catch(err){
                  console.log(err);
               }

            }
         });
      }
   });
  
   $('#mergeCheck').live('click', function(){
      var flag = $(this).val().toBool();
      $(this).val(!flag);
      if(flag){
         sessionStorage.setItem('mergeSales', '{}');
         if($('#mergeActive').length){
            $('#mergeActive').remove();
         }
      }
   });
   
   $('#dialogTable').tabbedDialog({
      tabs:{
         ajaxOptions: {
            cache: false,
            async: false,
            error: function( xhr, status, index, anchor ){
               $( anchor.hash ).html( "<div class='nothing'><h1>系統忙碌中, 請稍後再試</h1></div>" );
            }
         },
         cookie: {
            expires: 1
         },
         create: function(event, ui){
            $('#tabs').after('<div class="controlPanel"><input type="checkbox" id="mergeCheck" name="mergeCheck" value="false"/><label for="mergeCheck">合併作業</label></div>');
            $('#mergeCheck').button({icons: {primary:'ui-icon-contact'}});
         },
         select: function(event, ui){
            if(!!window.EventSource){
               tabs.close();
               var location = $.md5($('#dialogTable').data('url')[ui.index]['location']);
               serverFn(location, function(){
                  $('.ui-tabs-panel:eq('+ui.index+')',$('#dialogTable')).html(this.data);
               });
            }
         }
      },
      dialog:{
         'position': 'center',
         'modal': true,
         'width': 1020, 
         'height': 768,
         'dialogClass' : 'dialogTable',
         'minWidth': 800, 
         'autoOpen': false,
         'resizable': false,
         'draggable': false,
         'closeOnEscape': false,
         close : function(){
            clearInterval(window.pos.timerTable);
            tabs.close();
         },
         open : function(){
/*          
            if(!!!$('#mergeCheck').length){
               $('#tabs').after('<div class="controlPanel"><input type="checkbox" id="mergeCheck" name="mergeCheck" value="false"/><label for="mergeCheck">合併作業</label></div>');
               $('#mergeCheck').button({icons: {primary:'ui-icon-contact'}});
            }
      */       
            if(!!window.EventSource){
               var selected = $('#dialogTable').tabs( "option", "selected" );
               var location = $.md5($('#dialogTable').data('url')[selected]['location']);
               serverFn(location, function(){
                  $('.ui-tabs-panel:eq('+selected+')',$('#dialogTable')).html(this.data);
               });
            }else{
               clearInterval(window.pos.timerTable);    
               window.pos.timerTable = setInterval(function(){
                  var selected = $('#dialogTable').tabs( "option", "selected" );
                  $('#dialogTable').tabs("load" ,	selected);
               }, 950);
            }
         }
      }
   });
   
   $('#order_table tbody tr:not(.prev)').live('click', function(){
      try{
         if(method_exists('view_remark_assoc', 'eraser')){
            window.view_remark_assoc.eraser();
         }else{
            throw new Error(JSON.stringify({
               className:'view_remark_assoc',
               method:'eraser',
               callback:'view_remark_assoc.eraser();'
            }));
         }
      }catch(error){
         window.LoadScript(JSON.parse(error.message));
      }finally{
         sessionStorage.setItem('focusItem', $(this).attr('id'));
         window.DOM.onFocus();
      }
   });

   $('#page_yellow, #page_blue, #page_green, #page_red').live('click', function(){
      var theme = ['fn_p1', 'fn_p2', 'fn_p3', 'fn_p4'];
      var index = $('li', $('#tab')).index($(this));
      $(this).addClass('active').siblings().removeAttr('class');
      $( "#function_page" ).removeAttr('class').addClass( theme[index] );
      window.view_program_assoc.getProgram(theme[index]);
   });   

   setInterval(function(){
      this.data_table.unlock();
   }, 180000);    
   
});
