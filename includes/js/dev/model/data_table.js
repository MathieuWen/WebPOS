
window.data_table = new database({
   tbname : 'data_table',
   index : 'table_id',
   no : 'no',
   clumn : {
      'table_id' : 'id', 
      'no' : 'no', 
      'store_id' : 'store', 
      'name' : 'name', 
      'location' : 'location', 
      'remark' : 'remark',
      'active' : 'active',
      'lock' : 'lock'
   },
   start : 1,
   limit : 12,
   orderclumn: 'no',
   where : 'location <> ""'
});

jQuery.extend(window.data_table, function(data_obj){
   return {
      unlock: function(parameter, fn){
         var transfer = (parameter!==undefined) ? parameter.transfer || this.defaultTransfer : this.defaultTransfer;

         var sql = "UPDATE data_table SET `lock`='' WHERE TIME_TO_SEC(TIMEDIFF(CURRENT_TIMESTAMP, `udate`))>300 AND `lock` <> '';";
         data_obj[transfer+'Execute'](sql, fn);
      }
   }
}(window.data_table)); 
