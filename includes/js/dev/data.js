window.delayExecute(function(){
   var flag = function_exists('database');
   if(!flag){
      $.getScript(databaseDotJs);
   }
   return flag;
},function(){
   window.data_character = new database({
      tbname : 'character',
      index : 'id',
      no: 'id',
      clumn : {
         'id' : 'id', 
         'name' : 'name'
      },
      start : 1,
      limit : 12,
      orderclumn: 'id',
      where : 'name <> ""'
   });

   jQuery.extend(window.data_character, function(data_obj){
      var dbProp = data_obj.getproperties();
      return {
         keyboard : function(parameter, fn){
            var start = parameter.start || 1;
            var limit = parameter.limit || 26;
            var sql = {url:'language/xml/Character_'+parameter.lang+'.xml', start:start, limit:limit};
            this['xmlQuery'](sql, fn);
         }
      };
   }(window.data_character)); 

   

   jQuery.extend(window.data_character, function(data_obj){
      var drawTableId = '#itemlist_table';
      return {
         pickupCharacter: function(){
            var id = arguments[2];
            var self = this;
            //data_item.eraser().getItem(null, null, id);
         },
         
         getCharacter: function(start, limit){
            var self = this;
            start = start || 0;
            limit = limit || $('td', $(drawTableId)).length+1;
            data_obj.keyboard({lang:'English', start:start, limit:limit},function(){
               if(this.data){
                  self.showtable({
                     obj:$(drawTableId),
                     data:this.data,
                     start:start,
                     limit:limit,
                     fn:'getCharacter',
                     action:'pickupCharacter'
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
   }(window.data_character));
      
});

