var paysummary = function(posObj){
   var payment_spk = '';
   var ord = 0;
   var payment_amount = 0;
   var payment_cashover = 0;
   var payment_remark = 0;
   var payment_count = 0;
   var establishdate = 0;
   var status = 0;
   var display = DOM.displayEntyies();
   var lastestudate = '';
   (function(){
      Config = JSON.parse(  localStorage.getItem('ZConfig') );
      payment_spk = $.sha256( 'SP'+Config.store_id+Config.station_no+(new Date()).getTime() );
      establishdate = display.time;
      lastestudate = (new Date()).getTime();
   })();
   
   return {
      toCalculate : function(){
         var self = this;
         payment_amount = payment_cashover = payment_count = 0;
         var paylistReturn = [];
         for(key in posObj.paylist){
            if(posObj.paylist.hasOwnProperty(key)){
               var payProp = posObj.paylist[key].getproperties();
               if(!empty(payProp.returnable)){
                  if(paylistReturn.indexOf(payProp.returntype)>=-1){
                     paylistReturn.push(payProp.returntype);
                  }
               }
               payment_amount += parseFloat(payProp.paymentlist_amount);
               ++payment_count;
            }
         }
 
         var summProp = posObj[!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)?'subsumm':'summ'].getproperties();
         //var summProp =  posObj.summ.getproperties();
         payment_cashover = Math.round(payment_amount - (summProp.sales_amount + summProp.sales_allowance)).toInt();
         
         var IdentityNO = Min(paylistReturn);
        
         if(payment_cashover>0){
            window.delayExecute(function(){
               return isset(IdentityNO);
            },function() {
               self.toReturn(IdentityNO, posObj);
            });
         }else if((payment_cashover<0 && summProp.sales_amount>payment_amount) || (payment_cashover===0)  ){
            //console.log(Math.round(payment_cashover), summProp.sales_amount, payment_amount);
            lastestudate = (new Date()).getTime();
         }
         return this;
      },
      
      toReturn : function(IdentityNO, posObj){
         var self = this;
         //self.toCalculate();
         view_paydefined.queryByCondition({condition:{'paytype': IdentityNO}}, function(){
            if(this.data){
               var display = self.displayEntyies();
               var dataObj = this.data.pop();
               
               if(!strcasecmp(IdentityNO, window.TYPEDEPOSITRETURN)){
                  sales_prepaid.toDeposit({
                     customer_id:(JSON.parse(sessionStorage.getItem('customer'))).id,
                     paytype: window.TYPEDEPOSIT,
                     prepaid_amount:Math.round(payment_cashover)
                  });            
               }

               var payObj = new paymentlist(jQuery.extend(dataObj, {
                  seq: (payment_count+1),
                  establishdate: display.time,
                  payno: dataObj.no,
                  status: window.STATUSCHECKOUT
               }), posObj.paylist);
               jQuery.extend(payObj, viewEntyies);
               payObj.addAmount(-Math.round(payment_cashover));
               posObj.paylist[IdentityNO] = payObj;
            }
         });
         
         window.delayExecute(function(){
            return isset(posObj.paylist[IdentityNO]);
         },function(){
            self.toCalculate();
         });
      },
      
      getproperties : function(){
         return {
            payment_spk:payment_spk,
            ord:ord,
            payment_amount:payment_amount,
            payment_cashover:payment_cashover,
            payment_remark:payment_remark,
            payment_count:payment_count,
            establishdate:establishdate,
            status:status,
            lastestudate:lastestudate
         }
      },
      
      toRecover : function(receiptObj){
         payment_spk = receiptObj.payment_spk;
         ord = receiptObj.ord;
         payment_amount = receiptObj.payment_amount;
         payment_cashover = receiptObj.payment_cashover;
         payment_remark = receiptObj.payment_remark;
         payment_count = receiptObj.payment_count;
         establishdate = receiptObj.establishdate;
         status = receiptObj.status;
         return this;
      }
   }
}

var paymentlist = function(payObj, paylistObj){
   var paymentlist_spk = '';
   var seq = 1;
	var payno ='';
   var paytype ='';
   var payname ='';
   var curid = 1;
	var customer_id = 0;
	var customer_name = '';
	var rate_id = 1;
   var paymentlist_amount = 0;
   var payamount = 0;
   var tmp_amount  = 0;
	var establishdate = '';                     
	var status = 0;
   var paymentlist_remark ='';
   var Config = {};
   var upable = 0;
   var targetItem = '';
   var sign = '';
   var returnable = 0;
   var returntype = 0;
   var paygroup = -1;
   var userestrictions = 0;
   var totalrestrictions = 0;
   var period = '';
   var paymentlist_count = 1;
   var lastestudate = '';
   
   (function(){
      Config = JSON.parse(  localStorage.getItem('ZConfig') );
      paymentlist_spk = $.sha256( 'SPL'+Config.store_id+Config.station_no+(new Date()).getTime() );
      seq = payObj.seq || 1;
      establishdate = payObj.establishdate || (new Date()).getTime();
      payno = payObj.payno;
      paytype = payObj.paytype.toInt();
      customer_id = payObj.customer_id || 0;
      customer_name = payObj.customer_name || '';
      payname = payObj.name;
      upable = payObj.upable.toBool();
      curid = Config.curid;
      rate_id = Config.rate_id;
      payamount = parseFloat(payObj.payamount);
      returnable = payObj.returnable.toBool();
      returntype = payObj.returntype.toInt();
      paygroup = payObj.paygroup.toInt();
      period = payObj.period;
      status = payObj.status || 0;
      var tmp_userestrictions = payObj.userestrictions.toInt();
      userestrictions = (tmp_userestrictions===0)?9999:tmp_userestrictions;
      var tmp_totalrestrictions = payObj.totalrestrictions.toInt();
      totalrestrictions = (tmp_totalrestrictions===0)?9999:tmp_totalrestrictions;
      lastestudate = (new Date()).getTime();
   })();
   
   return {
      errorCode : ['輸入格式錯誤', '請輸入數字', '此優惠於此交易只能使用一次', '此優惠的次數已經結束','此優惠不得搭配其它種類的優惠', '此優惠的期間已經結束'],
  
      addAmount : function(money){
         var periodJudge = function(){
            //使用期間 (yyyy-mm-dd|yyyy-mm-dd[,yyyy-mm-dd|yyyy-mm-dd,...])
            var getUnixDateTime = function(datetime){
               return Math.round((new Date(datetime)).getTime() / 1000);
            }
           
            var flag = true;
            var now = ((this.displayEntyies()).time).toComma();
            if(period!==''){
               var session = period.split(',');
               for(var i=0; i<session.length; i++){
               var dateTime = (session[i].toComma()).split(new RegExp('(.*)+\\|+(.*)', 'g'));
               var start = getUnixDateTime(dateTime[1]);
               var end = getUnixDateTime(dateTime[2]);
               /*
                  var dateTime = (session[i].toComma()).test(/(.*)+\|+(.*)/g);
                  var start = getUnixDateTime(RegExp.$1);
                  var end = getUnixDateTime(RegExp.$2);
               */   
                  var nowTime = getUnixDateTime(now);
                  if( end<nowTime || start>nowTime ){
                     flag = 5;
                  }
               }
            }
            return flag;
         }
         
         var paygroupJudge = function(){
            var flag = true;
            if(paygroup!==-1){
               for(key in paylistObj){
                  if(paylistObj.hasOwnProperty(key)){
                     var group = paylistObj[key].getproperties().paygroup;
                     if(group!==-1 && group!==paygroup){
                        flag = 4;
                     }
                  }
               }
            }
            return flag;
         }
         
         var userestrictionsJudge = function(){
            return userestrictions>0?null:2;
         }         
         
         var totalrestrictionsJudge = function(){
            return totalrestrictions>0?null:3;
         }
      
         money = money || parseFloat((this.displayEntyies()).display_title);
         if((isNaN(money) || empty(money)) && upable && empty(payamount) )  return 2;
         var flag_userestrictions = userestrictionsJudge();
         var flag_totalrestrictions = totalrestrictionsJudge();
         if( flag_userestrictions===null && flag_totalrestrictions===null ){
            if(upable && empty(payamount) ){
               tmp_amount = money.toInt();
               paymentlist_count++;
               return this.toCalculate();
               
            }else if(upable&&payamount>0){
               var flag_paygroup = paygroupJudge();
               if(!isNaN(flag_paygroup))   return flag_paygroup;
               
               var flag_period = periodJudge();
               if(!isNaN(flag_period))   return flag_period;
               
               tmp_amount = parseFloat(payamount);
               paymentlist_count++;              
               return this.toCalculate();
               
            }else if(upable){
               return this.toCalculate();
            }
         }else{
            return flag_userestrictions || flag_totalrestrictions;
         }
         
         
      },   

      
      getproperties : function(){
         return {
            paymentlist_spk : paymentlist_spk, 
            seq : seq,       
            customer_id : customer_id,
            customer_name : customer_name,
            payno : payno, 
            paygroup : paygroup,
            returnable : returnable,
            returntype : returntype,
            curid : curid,           
            rate_id : rate_id,      
            paymentlist_amount : paymentlist_amount,
            paytype : paytype,   
            payname : payname,
            establishdate : establishdate,
            paymentlist_remark : paymentlist_remark,
            status : status
         };
      },
      
      toCalculate : function(){
         paymentlist_amount = paymentlist_amount.toInt()+tmp_amount.toInt();
         userestrictions = userestrictions.toInt()-paymentlist_count.toInt();
         totalrestrictions = totalrestrictions.toInt()-paymentlist_count.toInt();
         lastestudate = (new Date()).getTime();
         return this;
      },
      
      toRecover : function(paymentlistObj){
         paymentlist_spk = paymentlistObj.paymentlist_spk;
         seq = paymentlistObj.seq;
         customer_id = paymentlistObj.customer_id;
         customer_name = paymentlistObj.customer_name;
         payno = paymentlistObj.payno;
         paytype = paymentlistObj.paytype;
         payname = paymentlistObj.payname;
         curid = paymentlistObj.curid;
         rate_id = paymentlistObj.rate_id;
         paymentlist_amount = parseFloat(paymentlistObj.paymentlist_amount);
         paymentlist_count = paymentlistObj.paymentlist_count.toInt();
         paymentlist_remark = paymentlistObj.paymentlist_remark;
         establishdate = paymentlistObj.establishdate;
         status = paymentlistObj.status;
         return this;
      }
   };
}