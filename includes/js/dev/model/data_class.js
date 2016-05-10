
window.data_class = new database({
   tbname : 'data_class',
   index : 'class_id',
   no: 'class_no',
   clumn : {
      'class_id' : 'id', 
      'class_no' : 'no', 
      'class_name' : 'name', 
      'class_show' : 'active', 
      'class_remark' : 'remark',
      'ordering' : 'ordering'
   },
   start : 1,
   limit : 12,
   orderclumn: 'ordering',
   where : 'class_show = 1'
});

jQuery.extend(window.data_class, viewTable, function(){
   var drawTableId = '#grouplist_table';
   var drawGet = 'getClass';
   return {
      pickupClass: function(){
         var id = arguments[2];
         var self = this;
         window.data_item.eraser().getItem(null, null, id);
         $('#display_title').data('user', 0);
      },
      
      getClass: function(start, limit){
         var self = this;
         start = start || 0;
         limit = limit || $('td', $(drawTableId)).length+1;
         this.queryRange({
            start:start, 
            limit:limit, 
            where:''
         },function(){
            if(this.data){
               self.showtable({
                  obj:$(drawTableId),
                  data:this.data,
                  start:start,
                  limit:limit,
                  fn:'getClass',
                  action:'pickupClass'
               });
            }
         });
      },
      
      eraser: function(){
         var td = $('td', $(drawTableId));
         td.unbind();
         $('div', td).text('');
         $('input', td).val('');
         return this;
      }
   };
}());