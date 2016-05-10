
window.sales_receiptlist = new database({
   tbname : 'sales_receiptlist',
   index : 'saleslist_spk',
   no : 'sales_no',
	clumn : {
      'saleslist_spk' : 'saleslist_spk', 
      'store_id' : 'store_id', 
      'station_no' : 'station_no',	  
      'sales_no' : 'sales_no',
      'saleslist_tax' : 'saleslist_tax',                       //銷售稅(銷售金額*0.05)
      'seq' : 'seq',
      'item_id' : 'item_id', 
      'item_name' : 'item_name', 
      'item_salesprice' : 'item_salesprice',              //銷售單價
      'saleslist_quantity' : 'saleslist_quantity',         //數量
      'saleslist_amount' : 'saleslist_amount',           //結帳金額
      'saleslist_expenses' : 'saleslist_expenses',    //銷售金額(結帳金額／１．０５)
      'saleslist_point' : 'saleslist_point',                 //點數
      'saleslist_cost' : 'saleslist_cost',                   //銷售成本
      'healthtax' : 'healthtax',                               //健康捐
      'saleslist_exemption' : 'saleslist_exemption',  //免稅金
      'saleslist_discount' : 'saleslist_discount',       //折扣
      'saleslist_allowance' : 'saleslist_allowance',  //減項
      'saleslist_plus' : 'saleslist_plus',                     //加成
      'remark' : 'remark',
      'addprice' : 'addprice',
      'status' : 'status',
      'isprinted' : 'isprinted',
      'establishdate' : 'establishdate',
      'uby' : 'uby'
   },
   start : 1,
   limit : 12,
   orderclumn: 'seq',
   where : 'sales_no <> ""'
});



jQuery.extend(window.sales_receiptlist, viewTable, viewEntyies, function(dbObj){
   var dbProp = dbObj.getproperties();
   var employee = JSON.parse(  sessionStorage.getItem('employee') );  
   var seq = 1;
   return {
      mergeList : function(salesObj){
         var self = this;
         var alterStatus = function(){
            var saleslist_spk = this.saleslist_spk;
            dbObj.Update(function(){
               var clumn = ['saleslist_quantity', 'saleslist_amount', 'saleslist_expenses', 'saleslist_tax', 'saleslist_point', 'saleslist_cost', 'saleslist_exemption', 'saleslist_discount', 'saleslist_allowance', 'saleslist_plus', 'addprice'];
               var tmpObj = {};
               for(var i = clumn.length-1; i>-1; i--){
                  tmpObj[clumn[i]] = (new String()).concat('{', '-1', '*', clumn[i], '}');
               }
               return jQuery.extend(tmpObj, {
                  'saleslist_spk' : saleslist_spk,
                  'status' : window.STATUSDISABLEMERGE
               });
               
            }());
         }

         var createNewlist = function(itemProp, fn){
            //console.log(itemProp);
            dbObj.Replace({
               saleslist_spk : $.sha256( 'SL'+dbProp.Config.store_id+dbProp.Config.station_no+(new Date()).getTime() ), 
               store_id : dbProp.Config.store_id, 
               station_no : dbProp.Config.station_no,	  
               sales_no : sessionStorage.getItem('sales_no'),
               seq : seq++,
               saleslist_tax : itemProp.saleslist_tax,
               item_id : itemProp.item_id, 
               item_name : itemProp.item_name, 
               item_salesprice : itemProp.item_salesprice,
               saleslist_quantity : itemProp.saleslist_quantity,
               saleslist_amount : itemProp.saleslist_amount,
               saleslist_expenses : itemProp.saleslist_expenses,
               saleslist_point : itemProp.saleslist_point,
               saleslist_cost : itemProp.saleslist_cost,
               healthtax : 0,
               saleslist_exemption : itemProp.saleslist_exemption,
               saleslist_discount : itemProp.saleslist_discount,
               saleslist_allowance : itemProp.saleslist_allowance,
               saleslist_plus : itemProp.saleslist_plus,
               remark : itemProp.remark,
               addprice : itemProp.addprice,
               status : window.STATUSRECEIVEDORDER,
               establishdate: itemProp.establishdate,
               isprinted: itemProp.isprinted,
               uby : employee.name
            }, function(){
               fn.apply({saleslist_spk:itemProp.saleslist_spk});
            });
         }
 
         dbObj.queryRange({
            start:0, 
            limit:100, 
            where:{
               'sales_no':salesObj.sales_no, 
               'store_id':dbProp.Config.store_id, 
               'station_no':salesObj.station_no
            }
         },function(){
            var listData = this.data;
            if(listData){
               for(var key in listData){
                  if(listData.hasOwnProperty(key)){
                     createNewlist(listData[key], alterStatus);
                  }
               }
            }
         });
      },
      
      mergeStart : function(){
         var mergeObj = JSON.parse(sessionStorage.getItem('mergeSales'));
         for(var key in mergeObj){
            if(mergeObj.hasOwnProperty(key)){
               this.mergeList(mergeObj[key]);
            }
         }
      }

   }
}(window.sales_receiptlist));