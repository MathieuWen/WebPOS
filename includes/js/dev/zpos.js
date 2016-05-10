var ZPOS = function(){
   var self = this; 
   self.orderlist = {};
   self.paylist = {};
   self.table = {};
   self.employee = {};
   self.timerTable = {};
   self.summ = {};
   self.subsumm = {};
   self.paym = {};
   self.specsales = {};
   self.sales_spk = '';
   self.Config = JSON.parse( localStorage.getItem('ZConfig') );
   
   (function(){
      sessionStorage.setItem('focusItem', '');
      sessionStorage.setItem('sales_no', '');
      sessionStorage.setItem('sales_spk', '');
      //sessionStorage.setItem('employee' , '{}');
      sessionStorage.setItem('customer', '{}');
      sessionStorage.setItem('customer_total', '1');
      sessionStorage.setItem('table' , '{}');
      sessionStorage.setItem('displayString' , '{}');
      sessionStorage.setItem('status', '');
      sessionStorage.setItem('station_no', '');
   })();
   


   self.init = function(){
      self.destory().unlock();
      //sessionStorage.setItem('employee', '{}');
      sessionStorage.setItem('locKeyBord', true);
      sessionStorage.setItem('customer', '{"id":"0","no":"","name":"","sex":"","pass":"","":"","tel":"","fax":"","birth":"","email":"","addr":"","level":"","class":"","point":"","deposit":"","group":"","remark":"","uby":""}');
      sessionStorage.setItem('displayString', '{"display_title":"歡迎光臨","display_subtotal":"","customer":"---","point":"","deposit":"","taxid":"","sale":"","employee":"---","device":"---","addition_gift":"","addition_discount":"","addition_point":"","addition_allowance":"","addition_service":"","addition_charge":""}');
      sessionStorage.setItem('focusItem', '');
      sessionStorage.setItem('mergeSales', '{}');
      //sessionStorage.setItem('sales_no', localStorage.getItem('sales_no'));
      sessionStorage.setItem('table', '{}');
      sessionStorage.setItem('sales_spk', '');
      sessionStorage.setItem('status', '');
      sessionStorage.setItem('station_no', '');
      window.DOM.clear();
      sessionStorage.setItem('timestamp', (new Date()).getTime());
      
      if(empty(self.Config.table_autoStart)){
         window.sales_receipt.lastestNo({
            store_id:self.Config.store_id,
            station_no:self.Config.station_no
         }, function(){
            if(this.data){
               sessionStorage.setItem('sales_no', this.data.pop().lastestNo);
               self.purchaseStart();
            }
         });
      }else{
         $('#dialogTable').tabbedDialog('open');      
      }
      
      try{
         if(method_exists('data_class', 'getClass')){
            window.data_class.getClass();
         }else{
            throw new Error(JSON.stringify({
               className:'data_class',
               method:'getClass',
               callback:'pos.init()'
            }));
         }
         if(method_exists('view_program_assoc', 'getProgram')){
            window.view_program_assoc.getProgram(); 
         }else{
            throw new Error(JSON.stringify({
               className:'view_program_assoc',
               method:'getProgram',
               callback:'pos.init()'
            }));
         }
         if(method_exists('data_item', 'getReady')){
            window.data_item.getReady(); 
         }else{
            throw new Error(JSON.stringify({
               className:'data_item',
               method:'getReady',
               callback:'pos.init()'
            }));  
         }
         if(method_exists('view_paydefined', 'getReady')){
            window.view_paydefined.getReady(); 
         }else{
            throw new Error(JSON.stringify({
               className:'view_paydefined',
               method:'getReady',
               callback:'pos.init()'
            }));  
         }
         
         if(method_exists('sales_prepaid', 'getReady')){
            window.sales_prepaid.getReady();
         }else{
            throw new Error(JSON.stringify({
               className:'sales_prepaid',
               method:'getReady',
               callback:'pos.init()'
            }));
         }
         if(method_exists('data_customer', 'getReady')){
            window.data_customer.getReady();
         }else{
            throw new Error(JSON.stringify({
               className:'data_customer',
               method:'getReady',
               callback:'pos.init()'
            }));
         }
         
      }catch(error){
         //console.log(error.stack);
         window.LoadScript(JSON.parse(error.message));
      }finally{
         return self;
      }
   }
   
   self.mergeinit = function(){
      //$('#mergeCheck').val('false');
      try{
         //$('#mergeCheck').button('refresh');
         $('#mergeCheck').button('destroy');
         $('#mergeCheck').val("false").siblings('label').removeClass('ui-state-active');
         $('#mergeActive').remove();
      }catch(e){
         console.log(e);
      }finally{
         sessionStorage.setItem('mergeSales', '{}');
      }
      return self;
   }
   
   self.destory = function(){
      return (function(){
         for(var leng = arguments.length-1; leng>0; leng--){
            var obj = arguments[0][arguments[leng]];
            if(obj!==undefined){
               for(key in obj){
                  if(obj.hasOwnProperty(key)){
                     delete obj[key];
                  }
               }
            }
         }
         return arguments[0];
      })(self, 'orderlist', 'paylist', 'summ', 'paym', 'specsales');
   }
   
   self.unlock = function(){
      var table = JSON.parse(sessionStorage.getItem('table'));
      if(!empty(table.id)){
         window.data_table.Update({'table_id':table.id, 'lock':''});
      }
      return self;
   }
   
   self.actionStart = function(parameter){
      var station = JSON.parse(  localStorage.getItem('station') );
      var station_no = empty(parameter.station_no)? station.station_no: parameter.station_no;
      //console.log('actionStart', parameter);
      window.data_table.Update({
         'table_id': parameter.id, 
         'lock': station.station_no
      },function(){
         if(this.data){
            window.data_table.queryById({id:parameter.id},function(){
               if(this.data){
                  sessionStorage.setItem('table', JSON.stringify(this.data.pop()));
                  sessionStorage.setItem('sales_no', parameter.sales_no);
                  sessionStorage.setItem('station_no', parameter.station_no);
                  $('#dialogTable').tabbedDialog('close');
                  
                  if(empty(sessionStorage.getItem('sales_no'))){
                     window.sales_receipt.lastestNo({
                        store_id: self.Config.store_id,
                        station_no: station.station_no
                     }, function(){
                        if(this.data){
                           sessionStorage.setItem('sales_no', this.data.pop().lastestNo);
                        }
                     });
                  }
                  
                  window.delayExecute(function(){
                     return !empty(sessionStorage.getItem('sales_no'));
                  },function(){
                     self.purchaseStart({station_no: station_no});
                  });
               }
            });
         }
      });
   }
      
   self.purchaseStart = function(parameter){
      var status = sessionStorage.getItem('status').toInt();
      var sales_no = sessionStorage.getItem('sales_no');
      var employee = JSON.parse(  sessionStorage.getItem('employee') );
      var station_no = parameter.station_no || (JSON.parse(localStorage.getItem('station'))).station_no;
     window.sales_receiptlist.queryRange({
         start: 0, 
         limit: 100, 
         where:{
            'sales_no':sales_no, 
            'store_id': self.Config.store_id, 
            'station_no':station_no
         }
     },function(){
         var itemData = this.data;
         if(itemData){
            // 續單 ( 表身)
            for(var key in itemData){
               if(itemData.hasOwnProperty(key)){
                  window.data_item.restoreItem(itemData[key].item_id, itemData[key]);
               }
            }
         }
         
      });

      window.sales_receipt.queryByCondition({
         condition:{'sales_no':sales_no, 'store_id':self.Config.store_id, 'station_no':station_no}
      },function(){
         self.summ = new summary(self);
         self.subsumm = new subsummary(self);
         
         if(this.data){
            // 續單 ( 表頭)
            var dataObj = this.data.pop();
            self.summ.toRecover(dataObj);
            if(!empty(dataObj.customer_id)){
               window.data_customer.queryById({id:dataObj.customer_id}, function(){
                  if(this.data){
                     sessionStorage.setItem('customer', JSON.stringify(this.data.pop()));
                  }
               });
            }
         }
         
         jQuery.extend(self.summ, viewEntyies);
         jQuery.extend(self.subsumm, viewEntyies);
      });
         
   
      window.sales_paymentlist.queryRange({
         start: 0, 
         limit: 100, 
         where:{'sales_no': sales_no, 'store_id': self.Config.store_id, 'station_no':station_no}
      },function(){
         var payData = this.data;
         if(payData && strcasecmp(status, window.STATUSCHECKING) ){
            // 續單 ( 付款表身)
            for(var key in payData){
               if(payData.hasOwnProperty(key)){
                  window.view_paydefined.restorePay(payData[key].payno, payData[key]);
               }
            }
         }
         
      });
   
      
      window.sales_payment.queryByCondition({
         condition:{'sales_no': sales_no, 'store_id': self.Config.store_id, 'station_no':station_no}
      }, function(){
         self.paym = new paysummary(self);
         if(this.data && strcasecmp(status, window.STATUSCHECKING)){
            var dataObj = this.data.pop();
            // 續單 ( 付款表頭)
            self.paym.toRecover(dataObj);
         }
         jQuery.extend(self.paym, viewEntyies);
      });       
         


      try{
         window.delayExecute(function(){
            return !(empty(Object.size(self.summ))||empty(Object.size(self.paym)));
         },function(){
            self.specsales = new specialsales(self);
            DOM.all();
            sessionStorage.setItem('timestamp', (new Date()).getTime());
         });
      }catch(err){
         console.log(err);
      }
         
      return self;
   }
}


window.pos = new ZPOS();
