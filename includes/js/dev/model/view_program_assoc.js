
window.view_program_assoc = new database({
   tbname : 'view_program_assoc',
   index : 'program_id',
   no: 'program_no',
   clumn : {
      'program_id' : 'id', 
      'program_no' : 'no', 
      'program_label' : 'name',
      'program_name' : 'action',
      'program_argv' : 'argv',
      'program_content' : 'content',
      'store_id' : 'store_id',      
      'station_id' : 'station_id', 
      'associateKey' : 'associateKey', 
      'program_class' : 'program_class',
      'ordering' : 'ordering',
      'client_active' : 'client_active',
      'program_active' : 'program_active'
   },
   start : 1,
   limit : 12,
   orderclumn: 'ordering',
   where : 'program_active = 1 AND client_active = 1'
});    


jQuery.extend(window.view_program_assoc, function(data_obj){
   var dbProp = data_obj.getproperties();
   return {
      KeySearch :function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sql = "SELECT "+dbProp.sclumn+" FROM view_program_assoc WHERE associateKey = (SELECT data_keycode.KeyValue FROM data_keycode WHERE data_keycode.KeyCode ='"+parameter.associateKey+"');";
         this[transfer+'Query'](sql, fn);
      }
   };
}(window.view_program_assoc));

jQuery.extend(window.view_program_assoc, viewTable, viewEntyies, {
   pickupProgram: function(){
      var id = arguments[2];
      var dataObj = arguments[3];
      var self = this;
      this.queryById({id:id, transfer:'server'}, function(){
         if(this.data){
            var func = this.data.pop();
            var funName = func.action;
            var funArgv = func.argv;
            if(typeof window['ActionLister'][funName] ==='function'){
               window['ActionLister'][funName](funArgv);
               $('#display_title').data('user', 0);
            }else{
               self.displayEntyies({display_title:'此程式尚未開通'});
            }
         }
      });
   },

   getProgram: function(start, limit){
      var self = this;
      var programclass;
      if(isNaN(start)){
         programclass = start || 'fn_p1';
         start = 0;
      }else{
         start = start || 0;
         programclass = arguments[2] || 'fn_p1';
      }
      limit = limit || $('#function_table td').length+1;
      var Config = JSON.parse(  localStorage.getItem('ZConfig') );
      this.queryRange({
         start:start, 
         limit:limit, 
         where: {'store_id': Config.store_id, 'station_id': Config.station_id, 'program_class': programclass}, 
         transfer:'server'
      },function(){
         if(this.data){
            self.showtable({
               obj:$('#function_table'),
               data:this.data,
               start:start,
               limit:limit,   
               fn:'getProgram',
               action:'pickupProgram'
            });
         }
      });
   },
   
   eraser: function(){
      var td = $('td', $('#function_table'));
      td.unbind();
      $('div', td).text('');
      $('input', td).val('');
      return this;
   }
});