
window.view_paydefined = new database({
   tbname : 'view_paydefined',
   index : 'pay_index',
   no : 'payno',
   clumn : {
      'pay_index' : 'id', 
      'payno' : 'no', 
      'store_id' : 'store', 
      'station_id' : 'station', 
      'payname' : 'name', 
      'paytype' : 'paytype', 
      'upable' : 'upable',
      'targetItem' : 'targetItem',
      'sign' : 'sign',
      'payamount' : 'payamount',
      'returnable' : 'returnable',
      'returntype' : 'returntype',
      'paygroup' : 'paygroup',
      'userestrictions' : 'userestrictions',
      'totalrestrictions' : 'totalrestrictions'
   },
   start : 1,
   limit : 12,
   orderclumn: 'pay_index',
   where : 'payno <> ""'
});


jQuery.extend(window.view_paydefined, viewTable, viewEntyies, function(posObj){
   return {
      
      getReady : function(){
         console.log('view_paydefined is ready');
      },
      
      restorePay : function(IdentityNO, dataObj){
         this.queryByNo({no:IdentityNO}, function(){
            if(this.data){
               var paydefined = this.data.pop();
               var payObj = new paymentlist(paydefined, posObj.paylist);
               payObj.toRecover(dataObj).toCalculate();
               jQuery.extend(payObj, viewEntyies);
               posObj.paylist[IdentityNO] = payObj;
            }
         });
      },
      
      pickupPay : function(pay){
         var self = this;
         var customer = JSON.parse(  sessionStorage.getItem('customer') );
         var lastestudate = posObj.paym.getproperties().lastestudate;
         this.queryByNo({no:pay.IdentityNO}, function(){
            if(this.data){
               var dataObj = this.data.pop();
               if(empty(posObj.paylist[pay.IdentityNO])){
                  var display = self.displayEntyies();
                  var payObj = new paymentlist(jQuery.extend(dataObj, {
                     seq: posObj.paym.getproperties().payment_count+1,
                     customer_id: customer.id,
                     customer_name: customer.name,
                     establishdate: display.time,
                     payno: pay.IdentityNO
                  }), posObj.paylist);
                  
                  jQuery.extend(payObj, viewEntyies);
                  var pay_flag = payObj.addAmount(pay.payamount);

                  if(!isNaN(pay_flag)){
                     return self.displayEntyies({display_title:payObj.errorCode[pay_flag]});
                  }
                  
                  posObj.paylist[pay.IdentityNO] = payObj; 
               }else{
                  posObj.paylist[pay.IdentityNO].addAmount(pay.payamount);
               }
               //console.log(posObj.paylist);
               posObj.paym.toCalculate(); 
               
               //self.displayEntyies({addition_charge:pay.payamount});
            }
         });

         window.delayExecute(function(){
            //console.log(lastestudate);
            return posObj.paym.getproperties().lastestudate > lastestudate;
         },function() {
            ActionLister.balanceFinance();
         });
      }
   };
}(window.pos));
