
window.sales_receipt = new database({
   tbname : 'sales_receipt',
   index : 'sales_spk',
   no : 'sales_no',
   clumn : {
      'sales_spk' : 'sales_spk', 
      'sales_no' : 'sales_no', 
      'store_id' : 'store_id', 
      'station_no' : 'station_no', 
      'table_id' : 'table_id', 
      'employee_id' : 'employee_id', 
      'employee_name' : 'employee_name', 
      'customer_id' : 'customer_id',
      'customer_name' : 'customer_name',
      'sales_taxid' : 'sales_taxid',
      'creditcard_no' : 'creditcard_no',
      'sales_amount' : 'sales_amount',
      'sales_point' : 'sales_point',
      'sales_tax' : 'sales_tax',
      'sales_exemption' : 'sales_exemption',
      'sales_expenses' : 'sales_expenses',
      'sales_excessivepayment': 'sales_excessivepayment',   // 溢收款
      'sales_count' : 'sales_count',
      'sales_total' : 'sales_total',
      'sales_plus' : 'sales_plus',
      'sales_discount' : 'sales_discount',
      'sales_allowance' : 'sales_allowance',
      'healthtax' : 'healthtax',
      'status' : 'status',
      'customer_total' : 'customer_total',
      'establishdate' : 'establishdate',
      'debtdate' : 'debtdate',
      'checkdate' : 'checkdate',
      'sales_remark' : 'sales_remark',
      'uby' : 'uby'
   },
   start : 1,
   limit : 12,
   orderclumn: 'establishdate',
   where : 'status = 0'
});

jQuery.extend(window.sales_receipt, function(dbObj){
   var dbProp = dbObj.getproperties();
   var employee = JSON.parse(  sessionStorage.getItem('employee') );  
   return{
      lastestNo: function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sql = "SELECT IFNULL(lpad(MAX(`sales_no`)+1, 8, '0'), '00000001') AS `lastestNo` FROM `sales_receipt` WHERE `store_id` = '"+parameter.store_id+"' AND `station_no`='"+parameter.station_no+"' ORDER BY `sales_no` DESC LIMIT 1;";
         this[transfer+'Query'](sql, fn);
      },
      
      queryMerge: function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sumclumn = ['sales_amount', 'sales_expenses', 'sales_point', 'sales_tax', 'sales_exemption', 'sales_count', 'sales_total', 'sales_plus', 'sales_discount', 'sales_excessivepayment', 'sales_allowance', 'customer_total'];
         var clumn = ['table_id', 'customer_id', 'customer_name', 'creditcard_no', 'sales_taxid', 'establishdate'];
         
         var tmpArr = [];
         for(var j = clumn.length-1; j>-1; j--){
            tmpArr.push( (new String()).concat('`', clumn[j], '`', ' AS ', clumn[j]) );
         }      
         for(var i = sumclumn.length-1; i>-1; i--){
            tmpArr.push( (new String()).concat('SUM(`', sumclumn[i], '`)', ' AS ', sumclumn[i]) );
         }
         var sql = ['SELECT', tmpArr.join(', '), 'FROM', dbProp.tbname, 'WHERE', dbProp.index, 'IN', '("'+parameter.indexSet.join('", "')+'");'];
         //console.log(sql.join(' '));
         this[transfer+'Query'](sql.join(' '), fn);
      },
      
      mergeList : function(salesObj){
         var self = this;
         
         
         var alterStatus = function(){
            var indexSet = this.indexSet;
            for(var key in indexSet){
               if(indexSet.hasOwnProperty(key)){
                  dbObj.Update(function(){
                     var clumn = ['sales_amount', 'sales_expenses', 'sales_point', 'sales_tax', 'sales_exemption', 'sales_count', 'sales_total', 'sales_plus', 'sales_discount', 'sales_excessivepayment', 'sales_allowance'];
                     var tmpObj = {};
                     for(var i = clumn.length-1; i>-1; i--){
                        tmpObj[clumn[i]] = (new String()).concat('{', '-1', '*', clumn[i], '}');
                     }
                     return jQuery.extend(tmpObj, {
                        'sales_spk' : indexSet[key],
                        'sales_remark' : sessionStorage.getItem('sales_no'),
                        'status' : window.STATUSDISABLEMERGE
                     });
                  }());
               }
            }
         }

         var createNewlist = function(salesObj, fn){
            self.queryMerge({indexSet: salesObj.indexSet}, function(){
               var mergeObj = this.data.pop();
               fn.apply({indexSet: salesObj.indexSet});
               
               sessionStorage.setItem('customer_total', mergeObj.customer_total);
               dbObj.Replace({
                  sales_spk: $.sha256( 'SR'+dbProp.Config.store_id+dbProp.Config.station_no+(new Date()).getTime() ), 
                  sales_no: sessionStorage.getItem('sales_no'),
                  store_id: dbProp.Config.store_id,
                  station_no: dbProp.Config.station_no,
                  table_id: mergeObj.table_id,
                  employee_id: employee.id,
                  employee_name: employee.name,
                  customer_id: mergeObj.customer_id,
                  customer_name: mergeObj.customer_name,
                  sales_taxid: mergeObj.sales_taxid,
                  creditcard_no: mergeObj.creditcard_no,
                  sales_amount: mergeObj.sales_amount,
                  sales_expenses: mergeObj.sales_expenses,
                  sales_point: mergeObj.sales_point,
                  sales_tax: mergeObj.sales_tax,
                  sales_exemption: mergeObj.sales_exemption,
                  sales_total: mergeObj.sales_total,
                  sales_plus: mergeObj.sales_plus,
                  sales_discount: mergeObj.sales_discount,
                  sales_excessivepayment: mergeObj.sales_excessivepayment,
                  sales_allowance: mergeObj.sales_allowance,
                  healthtax: 0,
                  status: window.STATUSRECEIVEDORDER,
                  sales_count: mergeObj.sales_count,
                  customer_total: mergeObj.customer_total,
                  establishdate: mergeObj.establishdate,
                  debtdate: '{NULL}',
                  uby: employee.name
               });
            });
         }

         createNewlist(salesObj, alterStatus);
         return this;
      },
      
      mergeStart : function(){
         var mergeObj = JSON.parse(sessionStorage.getItem('mergeSales'));
         var indexSet = [], table_id, station_no;
         for(var key in mergeObj){
            if(mergeObj.hasOwnProperty(key)){
               if(empty(table_id)){
                  table_id = mergeObj[key].table_id;
                  station_no = mergeObj[key].station_no;
               }
               indexSet.push(mergeObj[key].sales_spk);
            }
         }
         
         if(this.mergeList({table_id:table_id, indexSet:indexSet})){
            return {
               table_id: table_id,
               station_no: station_no
            };
         }
      }      
   }
}(window.sales_receipt)); 