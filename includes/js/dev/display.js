
var display = function(posObj){
   var itemTableObj = '';
   (function(){
      itemTableObj = '#order_table';
   })();
   
   return {
      showOrderlist: function(){
         var html = [];
         if(posObj.orderlist!==undefined){
            var i = 1;
            for(key in posObj.orderlist){
               if(posObj.orderlist.hasOwnProperty(key)){
                  var itemObj = posObj.orderlist[key].getproperties();
                  var priceText = itemObj.saleprice;
                  var quantityText = itemObj.saleslist_quantity;
                  var discountText = (itemObj.item_discount)?Math.round(itemObj.item_discount*100)+'%':'';
                  var amountText = itemObj.saleslist_amount;
                  var remarkText = itemObj.remark.txt;
                  html.push('<tr id='+itemObj.spk+' class="'+((i%2)?'odd':'even')+(itemObj.prev?' prev':'')+'"><td>'+(i++)+'</td><td>'+itemObj.name+'</td><td>'+quantityText+'</td><td>'+priceText+'</td><td>'+discountText+'</td><td>'+amountText+'</td><td>'+remarkText+'</td></tr>'); 
               }
            }
         }
         $('tbody', $(itemTableObj)).html(html.join(''));
         return this;
      },
   
      onFocus: function(){
         var display_title = '歡迎光臨';
         var focusItem = sessionStorage.getItem('focusItem');
         if( typeof $('#'+focusItem).attr('id') !=='undefined' && focusItem !=='' ){
            var focusItemObj = $('#'+focusItem);
            focusItemObj.addClass('onfocus').siblings().removeClass('onfocus');
            
            var index = $('tbody tr', $(itemTableObj)).index(focusItemObj);

            $(itemTableObj).parents('div').scrollTop( index * parseFloat($('td', $(itemTableObj)).css('height')) );
            
            display_title = posObj.orderlist[focusItem].getproperties().name;
         }
         return this.displayEntyies({display_title:display_title, display_subtotal:''});
      },
   
      summary: function(){

         if(posObj.summ!==undefined){
            try{
               if(!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)){
                  var sumobj = posObj.subsumm && posObj.subsumm.toCalculate().getproperties();
               }else{
                  var sumobj = posObj.summ && posObj.summ.toCalculate().getproperties();
               }
               return this.displayEntyies({display_subtotal:'計'+sumobj.sales_count+'項, '+sumobj.sales_total+'筆, 總共'+sumobj.sales_amount+'元'});
            }catch(e){
               console.log(e);
               return this;
            }
         }else{
            return this;
         }
      },
         
      employee: function(){
         var employee = '---';
         var employeeObj = JSON.parse(sessionStorage.getItem('employee'));
         if(typeof employeeObj.name !=='undefined' && employeeObj !==''){
            employee = employeeObj.name;
         }

         return  this.displayEntyies({employee:employee});
      },   
      
      customer: function(){
         var customer = '---';
         var customerObj = JSON.parse(sessionStorage.getItem('customer'));
         if(typeof customerObj.name !=='undefined' && customerObj !==''){
            customer = customerObj.name;
         }

         return  this.displayEntyies({customer:customer});
      },
     
      sales: function(){
         var sale = '---';
         var sales_no = sessionStorage.getItem('sales_no');
         if(sales_no !==''){
            sale = sales_no;
         }

         return  this.displayEntyies({sale:sale});
      },

      table: function(){
         var table = JSON.parse(sessionStorage.getItem('table'));
         var device = '---';
         if(typeof table.id !=='undefined' && table !==''){
            device = table.no;
         }
         
         return this.displayEntyies({device:device});
      },
      
      all: function(){
         this.showOrderlist().onFocus().summary().employee().customer().table().sales();
      },
      
      clear: function(){
         var self = this;
         var clearEntyies = function(){
            var displayString = self.displayEntyies();
            for(entries in displayString){
               $('#'+entries).text(displayString[entries]);
            }
         }
         
         this.showOrderlist().onFocus().employee().table();  
         clearEntyies();
         
         if(method_exists('data_class', 'eraser')){
            window.data_class.eraser();
         }
         
         if(method_exists('data_item', 'eraser')){
            window.data_item.eraser();
         } 
         
      }
   }
}

window.DOM = new display(window.pos);
jQuery.extend(window.DOM, viewEntyies);