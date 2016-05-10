
window.view_remark_assoc = new database({
   tbname : 'view_remark_assoc',
   index : 'remarklist_id',
   no : 'remarklist_no',
   clumn : {
      'remark_id' : 'remark_id', 
      'class_id' : 'class_id', 
      'remarklist_no' : 'no', 
      'remarklist_id' : 'id', 
      'remarklist_name' : 'name', 
      'remark_type' : 'type', 
      'remarklist_price' : 'price'
   },
   start : 1,
   limit : 12,
   orderclumn: 'class_id',
   where : 'remarklist_id > 0'
});


jQuery.extend(window.view_remark_assoc, viewTable,{
   pickupReamrk: function(){
      var id = arguments[2];
      var self = this;
      this.queryById({id:id, transfer:'server'},function(){
         if(this.data){
            var itemObj = pos.orderlist[sessionStorage.getItem('focusItem')];
            var itemProp = itemObj.getproperties();
            var remarkObj = this.data.pop();
            itemObj.alterRemark(remarkObj);
            DOM.all();
         }	  
      }); 
   },
   
   getRemark: function(start, limit, class_id){
      var self = this;
      start = start || 0;
      limit = limit || $('#itemlist_table td').length+1;
      this.eraser().queryRange({
         start:start, 
         limit:limit, 
         where:{'class_id': class_id}
      },function(){
         if(this.data){
            self.showtable({
               obj:$('#itemlist_table'),
               data:this.data,
               start:start,
               limit:limit,
               fn:'getRemark',
               action:'pickupReamrk'
            });
         }
      });
   },
   
   eraser: function(){
      var td = $('td', $('#itemlist_table'));
      td.unbind();
      $('div', td).text('');
      $('input', td).val('');
      return this;
   }
});
