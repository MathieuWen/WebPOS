
window.sales_payment = new database({
   tbname : 'sales_payment',
   index : 'payment_spk',
   no : 'sales_no',
	clumn : {
		'payment_spk' : 'payment_spk', 
		'store_id' : 'store_id', 
		'station_no' : 'station_no',	  
		'sales_no' : 'sales_no',
		'ord' : 'ord', 
      'payment_amount' : 'payment_amount',
		'payment_cashover' : 'payment_cashover',
      'payment_remark' : 'payment_remark',
		'payment_count' : 'payment_count',
		'establishdate' : 'establishdate', 
		'uby' : 'uby',
		'status' : 'status',      
		'udate' : 'udate',     
   },
   start : 1,
   limit : 12,
   orderclumn: 'sales_no',
   where : 'sales_no <> ""'
});

jQuery.extend(window.sales_payment, function(dbObj){
   var dbProp = dbObj.getproperties();
   var employee = JSON.parse(  sessionStorage.getItem('employee') );  
   return{
      searchSPK: function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sql = "SELECT "+dbProp.index+" AS `spk` FROM `sales_payment` `sp`, `sales_receipt` `sr` WHERE `sp`.`sales_no` = `sr`.`sales_no` AND `sp`.`store_id` = `sr`.`store_id` AND `sp`.`station_no` = `sr`.`station_no` AND `sr`.`sales_spk` IN('"+parameter.indexSet.join("','")+"')";
         this[transfer+'Query'](sql, fn);
      },
     
      queryMerge: function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sumclumn = ['payment_amount', 'payment_cashover', 'payment_count'];
         var clumn = ['ord', 'payment_remark', 'establishdate'];
         
         var tmpArr = [];
         for(var j = clumn.length-1; j>-1; j--){
            tmpArr.push( (new String()).concat('`', clumn[j], '`', ' AS ', clumn[j]) );
         }      
         for(var i = sumclumn.length-1; i>-1; i--){
            tmpArr.push( (new String()).concat('SUM(`', sumclumn[i], '`)', ' AS ', sumclumn[i]) );
         }
         var sql = ['SELECT', tmpArr.join(', '), 'FROM', dbProp.tbname, 'WHERE', dbProp.index, 'IN', '("'+parameter.indexSet.join('", "')+'");'];
         this[transfer+'Query'](sql.join(' '), fn);
      },
      
      mergeList : function(salesObj){
         var self = this;  
         
         var alterStatus = function(){
            var indexSet = this.indexSet;
            for(var i=indexSet.length-1; i>-1; i--){
               dbObj.Update(function(){
                  return {
                     'payment_spk' : indexSet[i],
                     'status' : window.STATUSDISABLEMERGE
                  };
               }());
            }
         }

         var createNewlist = function(salesObj, fn){
            self.searchSPK({indexSet:salesObj.indexSet}, function(){
               var indexSet = [];
               for(var key in this.data){
                  indexSet.push(this.data[key].spk);
               }
               console.log(indexSet);
               self.queryMerge({indexSet: indexSet}, function(){
                  var mergeObj = this.data.pop();
                  dbObj.Replace({
                     payment_spk: $.sha256( 'SP'+dbProp.Config.store_id+dbProp.Config.station_no+(new Date()).getTime() ), 
                     store_id: dbProp.Config.store_id,
                     station_no: dbProp.Config.station_no,
                     sales_no: sessionStorage.getItem('sales_no'),
                     ord: mergeObj.ord,
                     payment_amount: mergeObj.payment_amount,
                     payment_cashover: mergeObj.payment_cashover,
                     payment_remark: mergeObj.payment_remark,
                     payment_count: mergeObj.payment_count,
                     establishdate: mergeObj.establishdate,
                     uby: employee.name,
                     status: window.STATUSRECEIVEDORDER
                  }, function(){
                     fn.apply({indexSet: indexSet});
                  });
               });
            });
         }

         createNewlist(salesObj, alterStatus);
      },
      
      mergeStart : function(){
         var mergeObj = JSON.parse(sessionStorage.getItem('mergeSales'));
         var indexSet = [], table_id;
         for(var key in mergeObj){
            if(mergeObj.hasOwnProperty(key)){
               if(empty(table_id)){
                  table_id = mergeObj[key].table_id;
               }
               indexSet.push(mergeObj[key].sales_spk);
            }
         }
         
         this.mergeList({table_id:table_id, indexSet:indexSet});
      }
   }
}(window.sales_payment)); 


jQuery.extend(window.sales_payment, function(dbObj){
   var dbProp = dbObj.getproperties();
   return {
      changeStatus2checkOut : function(){ 
         dbObj.queryRange({
            start: 0, 
            limit: 100, 
            where:{
               'sales_no': sessionStorage.getItem('sales_no'), 
               'store_id': dbProp.Config.store_id, 
               'station_no':sessionStorage.getItem('station_no')
            }
         },function(){
            var payData = this.data;
            if(payData){
               for(var key in payData){
                  if(payData.hasOwnProperty(key)){
                     dbObj.Update(function(){
                        var tmpObj = {};
                        return jQuery.extend(tmpObj, {
                           'payment_spk' : payData[key].payment_spk,
                           'status' : window.STATUSCHECKOUT
                        });
                     }());
                  }
               }
            }
         });
      }
   }
}(window.sales_payment));