var viewEntyies = {
  displayEntyies : function(StringObj){
     var displayString = JSON.parse(sessionStorage.getItem('displayString'));
     if(typeof StringObj === 'undefined'){
         return displayString;
     }else{
         for(entries in StringObj){
            var domObj = $('#'+entries);
            domObj.text(StringObj[entries]);
            displayString[entries] = StringObj[entries];
         }
         sessionStorage.setItem('displayString', JSON.stringify(displayString));
         return this;
     }
  }
};



var viewTable = {
  showtable: function(dataObj){
      if(typeof dataObj === 'undefined' || typeof dataObj.data === 'undefined'){
         return;
      }
      var self = this;
      var obj = dataObj.obj;
      var td = $('td', obj);
      td.unbind();
      $('div', td).text('');
      $('input', td).val('');

      var data = dataObj.data;
      var start = dataObj.start;
      var limit = dataObj.limit;

      var Prevflag = td.length-$('tr:first-child td', obj).length;
      $.each(data, function(key, val){
         if( key>=Prevflag && start!==0){
            $('div', td.eq(key+1)).text(val.name);
            $('input', td.eq(key+1)).val(val.id);             
         }else{
            $('div', td.eq(key)).text(val.name);
            $('input', td.eq(key)).val(val.id);      
         }
         try{   
            $(td.eq(key)).unbind().bind('click', function(){
               self[dataObj.action](0, false, $('input', this).val());
            });
         }catch(e){
            user_error('找無該物件['+dataObj.action+']', 256);
         }
      });
         
      if(data.length>td.length){
         $('div', td.last()).text('下一頁');
         $(td.last()).unbind().bind('click', function(){
            var NextStart = (start===0) ? 
               td.length-1: 
               start+td.length-2;
               self[dataObj.fn](NextStart, limit);
         });
      }
         
      if(start!==0){
         PrevIndex = -$('tr:first-child td', obj).length;
         $('div', td.eq(PrevIndex)).text('上一頁');
         $('tr:last-child td:first-child', obj).unbind().bind('click', function(){
            var PrevStart = (  (start-limit)<=0 ) ? 0:(start-td.length+2);
            self[dataObj.fn](PrevStart, limit);
         });
      }

      var autofill = function(){
         td.css({'width' : function(){
            return Math.ceil(100 / $('tr:first-child td', obj).length)+'%';
         }, 'height' : function(index, value){
            return Math.ceil(100 / $('tr', obj).length)+'%';
         }});
      }
   }
};
