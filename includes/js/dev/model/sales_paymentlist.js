
window.sales_paymentlist = new database({
   tbname : 'sales_paymentlist',
   index : 'paymentlist_spk',
   no : 'sales_no',
	clumn : {
		'paymentlist_spk' : 'paymentlist_spk', 
		'store_id' : 'store_id', 
		'station_no' : 'station_no',	  
		'sales_no' : 'sales_no',
		'customer_id' : 'customer_id',
		'customer_name' : 'customer_name',
		'seq' : 'seq', 
      'payno' : 'payno',
		'paytype' : 'paytype',
      'payname' : 'payname',
		'curid' : 'curid',
		'rate_id' : 'rate_id', 
		'paymentlist_amount' : 'paymentlist_amount',
		'paymentlist_count' : 'paymentlist_count',
		'paymentlist_remark' : 'paymentlist_remark',
		'establishdate' : 'establishdate',
		'status' : 'status',
		'udate' : 'udate',     
		'uby' : 'uby',     
   },
   start : 1,
   limit : 12,
   orderclumn: 'sales_no',
   where : 'sales_no <> ""'
});

jQuery.extend(window.sales_paymentlist, viewTable, viewEntyies, function(dbObj){
   var dbProp = dbObj.getproperties();
   var employee = JSON.parse(  sessionStorage.getItem('employee') );  
   var seq = 1;
   return {
      querymergePayList: function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sumclumn = ['paymentlist_amount', 'paymentlist_count'];
         var clumn = ['customer_id', 'customer_name', 'payno', 'paytype', 'payname', 'curid', 'rate_id', 'establishdate'];
         
         var tmpArr = [];
         for(var j = clumn.length-1; j>-1; j--){
            tmpArr.push( (new String()).concat('`'+dbProp.tbname+'`.`', clumn[j], '`', ' AS ', clumn[j]) );
         }      
         for(var i = sumclumn.length-1; i>-1; i--){
            tmpArr.push( (new String()).concat('SUM(`', dbProp.tbname,'`.`', sumclumn[i], '`)', ' AS ', sumclumn[i]) );
         }
         var sql = ['SELECT', tmpArr.join(', '), 'FROM', dbProp.tbname+', sales_receipt', 'WHERE'], tmp='';
         tmp += sql.join(' ')+' sales_paymentlist.store_id = sales_receipt.store_id';
         tmp += ' AND sales_paymentlist.station_no = sales_receipt.station_no';
         tmp += ' AND sales_paymentlist.sales_no = sales_receipt.sales_no';
         tmp += ' AND sales_receipt.sales_spk IN ("'+parameter.indexSet.join('", "')+'")';
         tmp += ' GROUP BY sales_paymentlist.payno';
        // console.log(tmp);
         this[transfer+'Query'](tmp, fn);
      },
      
      mergeList : function(salesObj){
         var self = this;
         var alterStatus = function(paymentlist_spk){
            //var paymentlist_spk = this.paymentlist_spk;
            dbObj.Update(function(){
               var clumn = ['paymentlist_amount'];
               var tmpObj = {};
               for(var i = clumn.length-1; i>-1; i--){
                  tmpObj[clumn[i]] = (new String()).concat('{', '-1', '*', clumn[i], '}');
               }
               
               return jQuery.extend(tmpObj, {
                  'paymentlist_spk' : paymentlist_spk,
                  'status' : window.STATUSDISABLEMERGE
               });
            }());
         }

         dbObj.queryRange({
            start:0, 
            limit:100, 
            where:{
               'sales_no': salesObj.sales_no, 
               'store_id': dbProp.Config.store_id, 
               'station_no': salesObj.station_no
            }
         },function(){
            var listData = this.data;
            if(listData){
               for(var key in listData){
                  if(listData.hasOwnProperty(key)){
                     alterStatus(listData[key].paymentlist_spk);
                  }
               }

            }
         });
      },
      
      mergeStart : function(){

         var createNewlist = function(paylistProp){
            dbObj.Replace({
               paymentlist_spk : $.sha256( 'SPL'+dbProp.Config.store_id+dbProp.Config.station_no+(new Date()).getTime() ), 
               store_id : dbProp.Config.store_id, 
               station_no : dbProp.Config.station_no,	  
               sales_no : sessionStorage.getItem('sales_no'),
               seq : seq++,
               customer_id: paylistProp.customer_id,
               customer_name: paylistProp.customer_name,
               payno : paylistProp.payno, 
               paytype : paylistProp.paytype, 
               payname : paylistProp.payname,
               curid : paylistProp.curid,
               rate_id : paylistProp.rate_id,
               paymentlist_amount : paylistProp.paymentlist_amount,
               paymentlist_count : paylistProp.paymentlist_count,
               paymentlist_remark : paylistProp.paymentlist_remark,
               establishdate : paylistProp.establishdate,
               status : window.STATUSRECEIVEDORDER,
               uby : employee.name
            });
         }
         
         var mergeObj = JSON.parse(sessionStorage.getItem('mergeSales'));
         var tmpArr = [];
         for(var key in mergeObj){
            if(mergeObj.hasOwnProperty(key)){
               this.mergeList(mergeObj[key]);
               tmpArr.push(mergeObj[key].sales_spk);
            }
         }
         
         this.querymergePayList({indexSet: tmpArr}, function(){
            var dataObj = this.data;
            if(dataObj){
               for(var key in dataObj){
                  if(dataObj.hasOwnProperty(key)){
                     createNewlist(dataObj[key]);
                  }
               }
            }
         });
      }
   }
}(window.sales_paymentlist));


jQuery.extend(window.sales_paymentlist, function(dbObj){
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
                           'paymentlist_spk' : payData[key].paymentlist_spk,
                           'status' : window.STATUSCHECKOUT
                        });
                     }());
                  }
               }
            }
         });
      }
   }
}(window.sales_paymentlist));