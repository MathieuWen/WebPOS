
window.sales_prepaid = new database({
   tbname : 'sales_prepaid',
   index : 'prepaid_id',
   no: 'station_no',
   clumn : {
      'prepaid_id' : 'prepaid_id', 
      'customer_id' : 'customer_id', 
      'store_id' : 'store_id', 
      'station_no' : 'station_no', 
      'cur_id' : 'cur_id',
      'paytype' : 'paytype',
      'rate_id' : 'rate_id',
      'prepaid_amount' : 'prepaid_amount',
      'udate' : 'udate',
      'uby' : 'uby'
   },
   start : 1,
   limit : 12,
   orderclumn: 'prepaid_id',
   where : 'customer_id <> ""'
});


jQuery.extend(window.sales_prepaid, function(data_obj){
   var dbProp = data_obj.getproperties();
   var employee = JSON.parse(sessionStorage.getItem('employee'));
   return {
      getReady : function(){
         console.log('sales_prepaid is ready');
      },
      
      toDeposit : function(parameter, fn){
         //var type = {'money':7, 'point':13};
         var Config = dbProp.Config;
         
         data_obj.Insert({
            customer_id: parameter.customer_id,
            store_id: Config.store_id,
            station_no: Config.station_no,
            cur_id: Config.cur_id,
            paytype: parameter.paytype,
            rate_id: Config.rate_id,
            prepaid_amount: parameter.prepaid_amount,
            uby: employee.name
         }, fn);
      },
      toDraw : function(parameter, fn){
         //var type = {'money':7, 'point':13};
         var Config = dbProp.Config;
         data_obj.Insert({
            customer_id: parameter.customer_id,
            store_id: Config.store_id,
            station_no: Config.station_no,
            cur_id: Config.cur_id,
            paytype: parameter.paytype,
            rate_id: Config.rate_id,
            prepaid_amount: -1*parameter.prepaid_amount,
            uby: employee.name
         }, fn);     
      }
   };
}(window.sales_prepaid)); 
