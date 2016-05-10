/*
 *    銷售單表頭 / 結帳表
 *
 */

var summary = function(posObj){
   var sales_spk = '';
   var timestamp = '';
   var sales_taxid = '';
   var creditcard_no = '';
   var sales_amount = 0;
   var sales_point = 0;
   var sales_tax = 0;
   var sales_expenses = 0;
   var sales_exemption = 0;
   var sales_count = 0;
   var sales_total = 0;
   var sales_plus = 0;
   var sales_discount = 0;
   var sales_excessivepayment = 0;
   var sales_allowance = 0;
   var status = 0;
   var customer_total = 1;
   var establishdate = '';   
   var Config = {};

   (function(){
      timestamp = (new Date()).getTime();
      Config = JSON.parse(  localStorage.getItem('ZConfig') );
      sales_spk = $.sha256( 'SR'+Config.store_id+Config.station_no+timestamp);
      establishdate = '{CURRENT_TIMESTAMP}';
      sessionStorage.setItem('sales_spk', sales_spk);
   })();
   
	return {
      errorCode : ['輸入格式錯誤', '請輸入數字', '無法折讓', '統一編號資料格式錯誤'],
      
      // 改折讓
      alterAllowance : function(allowance){
         if(!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)){
            sales_allowance += parseFloat(allowance);
            return this.toCalculate();
         }
         var toWeightedAverage = function(parameter){
            var factorSum  = 0;
            for(var i=parameter.factor.length-1;i>-1;factorSum+=parameter.factor[i--]);

            var round = function(n) { 
               return parseFloat((new Number(n)).toFixed(parameter.point)); 
            }
            var totalAmount = parameter.amount, distribution = [];
            for(var i=0;i<parameter.factor.length;i++){
               var tmp=round(parameter.factor[i]/factorSum*totalAmount);
               distribution.push(tmp);
               totalAmount -= tmp;
               factorSum = round(factorSum - parameter.factor[i]);
            }
            return distribution;
         }
         
         var displayString = this.displayEntyies();
         allowance = allowance || parseFloat(displayString.display_title);
         if(isNaN(allowance)||allowance==='')  return 1;
         if(Config.purchase_default_allowable_allowance==='1'){
            sales_allowance = parseFloat(allowance);
            var factor = [], itemID = [];
            for(var key in posObj.orderlist){
               if(posObj.orderlist.hasOwnProperty(key)){
                  var itemProp = posObj.orderlist[key].getproperties();
                  factor.push(parseFloat(itemProp.saleslist_amount));
                  itemID.push(key);
               }
            }
            var suballowance = toWeightedAverage({factor: factor, amount:allowance, point:2});
            for(var i=itemID.length-1;i>-1;posObj.orderlist[itemID[i]].alterAllowance(suballowance[i--]));
            
            return this.toCalculate();
         }else{
            return 2;
         }
      },
     // 改統編
     alterTaxid : function(taxid){
         var displayString = this.displayEntyies();
         taxid = taxid || displayString.display_title;
         if(isNaN(taxid)||taxid==='')  return 1;
         if(taxid.is_taxid()){
            sales_taxid = taxid;
            return this.displayEntyies({taxid:taxid});
         }
         return 3;
     },
     
		toCalculate : function(){
         sales_amount = sales_count = sales_total = sales_point = sales_tax = sales_exemption = sales_plus = sales_discount = sales_expenses = sales_excessivepayment = 0;
   
         for(var key in posObj.orderlist){
            if(posObj.orderlist.hasOwnProperty(key)){
               var itemProp = posObj.orderlist[key].getproperties();
                  sales_amount += parseFloat(itemProp.saleslist_amount);
                  //sales_expenses += parseFloat(itemProp.saleslist_expenses);
                  sales_total += parseFloat(itemProp.saleslist_quantity);
                  sales_point += parseFloat(itemProp.saleslist_point);
                  sales_tax += parseFloat(itemProp.saleslist_tax);
                  sales_exemption += parseFloat(itemProp.saleslist_exemption);
                  sales_plus += parseFloat(itemProp.saleslist_plus);
                  sales_discount += parseFloat(itemProp.saleslist_discount);
                  //sales_allowance += parseFloat(itemProp.saleslist_allowance);
                  ++sales_count;
            }
         }
           // console.log(SpecialSales);
            // 結帳金額
            //sales_amount -= parseFloat(sales_allowance);
   /* 
            var tmp_expense = (sales_amount - sales_exemption) / (1+parseFloat(Config.sales_taxrate));
            sales_tax = tmp_expense * (parseFloat(Config.sales_taxrate));
            
            // 營業稅
            sales_tax = (new Number(sales_tax)).toFixed(2);
       */      
         // 免稅額
         sales_exemption = parseFloat((new Number(sales_exemption)).toFixed(2));
            
         var tmp_amount = sales_amount;
         // 總結帳金額
         sales_amount = Math[Config.calculation](sales_amount);
            
         sales_expenses = parseFloat((new Number(sales_amount  - sales_tax)).toFixed(2));
            
         // 盈餘
         sales_excessivepayment = parseFloat((new Number(sales_amount - tmp_amount)).toFixed(2));
         sales_discount = (new Number(sales_discount)).toFixed(2);

            
         var addition_point = (sales_point===0)?'':sales_point;
         var addition_discount = (parseFloat(sales_discount)-parseFloat(sales_excessivepayment)===0)?'':(new Number(parseFloat(sales_discount)-parseFloat(sales_excessivepayment))).toFixed(2);
         var addition_allowance = (sales_allowance===0)?'':sales_allowance;
         var addition_service = sales_plus?(new Number(sales_plus)).toFixed(2):'';
         
         if(!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)){
            posObj.subsumm.toCalculate();
         }else{
            this.displayEntyies({
               addition_point: addition_point,
               addition_discount: addition_discount,
               addition_allowance: addition_allowance,
               addition_service: addition_service
            });   
         }
         
         return this;
     },
      
     getproperties : function(){
         return {
            sales_spk:sales_spk,
            sales_taxid:sales_taxid,
            creditcard_no:creditcard_no,
            status:status,
            customer_total:customer_total,
            establishdate:establishdate,
            sales_amount:sales_amount,
            sales_count:sales_count,
            sales_total:sales_total,
            sales_point:sales_point,
            sales_tax:sales_tax,
            sales_expenses:sales_expenses,
            sales_excessivepayment:sales_excessivepayment,
            sales_exemption:sales_exemption,
            sales_plus:sales_plus,
            sales_discount:sales_discount,
            sales_allowance:sales_allowance
         }
     },
     
     toRecover : function(receiptObj){
         sales_spk = receiptObj.sales_spk;
         sales_taxid = receiptObj.sales_taxid;
         creditcard_no = receiptObj.creditcard_no;
         sales_amount = parseFloat(receiptObj.sales_amount);
         sales_point = parseFloat(receiptObj.sales_point);
         sales_expenses = parseFloat(receiptObj.sales_expenses);
         sales_tax = parseFloat(receiptObj.sales_tax);
         sales_exemption = parseFloat(receiptObj.sales_exemption);
         sales_total = parseFloat(receiptObj.sales_total);
         sales_plus = parseFloat(receiptObj.sales_plus);
         sales_excessivepayment = parseFloat(receiptObj.sales_excessivepayment);
         sales_discount = parseFloat(receiptObj.sales_discount);
         sales_allowance = parseFloat(receiptObj.sales_allowance);
         status = receiptObj.status;
         sales_count = receiptObj.sales_count;
         customer_total = parseFloat(receiptObj.customer_total);
         establishdate = receiptObj.establishdate;    
     },
     
      toGift : function(){
         var sprid = arguments[1];
      }
   }
}
