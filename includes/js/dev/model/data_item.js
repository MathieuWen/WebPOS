
window.data_item = new database({
   tbname : 'data_item',
   index : 'item_id',
   no: 'item_no',
   clumn : {
      'item_id' : 'id', 
      'item_no' : 'no', 
      'item_name' : 'name', 
      'item_price' : 'price',
      'item_class' : 'item_class',
      'item_vender' : 'vender',
      'item_brand' : 'brand',
      'item_point' : 'point',
      'item_image' : 'img',
      'item_discount' : 'discount',
      'item_upprice' : 'upprice',
      'item_service' : 'service',
      'item_selltax' : 'selltax',
      'item_outputlist' : 'outputlist',
      'item_label' : 'label',
      'item_barcode' : 'barcode',
      'item_cost' : 'cost',
      'item_saleprice1' : 'saleprice1',
      'item_saleprice2' : 'saleprice2',
      'item_saleprice3' : 'saleprice3',
      'item_avgcost' : 'avgcost',
      'item_stock' : 'stock',
      'item_location' : 'location',
      'item_donate' : 'donate', 
      'item_show' : 'active', 
      'item_remark' : 'remark',
      'ordering' : 'ordering'
   },
   start : 1,
   limit : 12,
   orderclumn: 'ordering',
   where : 'item_show = 1'
});

jQuery.extend(window.data_item, function(data_obj){
    var dbProp = data_obj.getproperties();
    return {
      multipleSearch : function(parameter, fn){
         var transfer = parameter.transfer || dbProp.defaultTransfer;
         var sql = "SELECT "+dbProp.sclumn+" FROM data_item WHERE "+dbProp.where+" AND (UCASE(item_no) LIKE '"+parameter.no+"%' OR UCASE(item_name) LIKE '"+parameter.no+"%' OR UCASE(item_barcode) LIKE '"+parameter.no+"%') ORDER BY "+dbProp.orderclumn+" "+dbProp.orderby+" LIMIT "+parameter.start+","+parameter.limit+";";
         this[transfer+'Query'](sql, fn);
      }
   };
}(window.data_item)); 


jQuery.extend(window.data_item, viewTable, viewEntyies, function(posObj){
   var drawTableId = '#itemlist_table';
   var tmp_no = '';
   return {
      
      getReady : function(){
         console.log('data_item is ready');
      },
      
      restoreItem: function(id, dataObj){
         if(typeof dataObj === 'undefined' || typeof id === 'undefined' )   return;
         this.queryById({id:id}, function(){
            if(this.data){
               var itemData = this.data.pop();
               var itemObj = new Item(itemData, posObj);
               itemObj.toRecover(dataObj);
               jQuery.extend(itemObj, viewEntyies);
                
               window.view_SpecialSales.queryRange({
                  start:0, 
                  limit:100, 
                  where:{'item_id': itemData.id}
               },function(){
                  var special = this.data;
                  if(special){
                     for(var key in special){
                        window.view_SpecialSales.queryRange({
                           start:0, 
                           limit:100, 
                           where:{'special_rule_index': special[key].id}
                        },function(){
                           if(this.data){
                              var Oricount = Object.size(posObj.summ.getproperties().SpecialSales);
                              var Oritimestamp = sessionStorage.getItem('timestamp');
                              posObj.specsales.setSpecialSales(special[key].id, this.data);
                              window.delayExecute(function(){
                                 return Object.size(posObj.summ.getproperties().SpecialSales) !== Oricount || Oritimestamp < sessionStorage.getItem('timestamp');
                              },function(){
                                 posObj.summ.toCalculate();
                                 DOM.all();
                              });
                           }
                        });
                     }
                  }
               });
               
               posObj.orderlist[itemObj.getproperties().spk] = itemObj;
               DOM.all();
            }
         });
      },
      
      pickupItem: function(){
         var id = arguments[2];
         var self = this;
         this.queryById({id:id}, function(){
            if(this.data){
               var display = self.displayEntyies();
               var dataObj = this.data.pop();
               var itemObj = new Item(jQuery.extend(dataObj, {
                  seq:parseInt(posObj.summ.getproperties().sales_count, 10)+1,
                  establishdate: display.time
               }), posObj);
               
               window.view_SpecialSales.queryRange({
                  start:0, 
                  limit:100, 
                  where:{'item_id': dataObj.id}
               },function(){
                  var special = this.data;
                  if(special){
                     for(var key in special){
                        window.view_SpecialSales.queryRange({
                           start:0, 
                           limit:100, 
                           where:{'special_rule_index': special[key].id}
                        },function(){
                           if(this.data){
                              var Oricount = Object.size(posObj.summ.getproperties().SpecialSales);
                              var Oritimestamp = sessionStorage.getItem('timestamp');
                              posObj.specsales.setSpecialSales(special[key].id, this.data);
                              window.delayExecute(function(){
                                 return Object.size(posObj.summ.getproperties().SpecialSales) !== Oricount || Oritimestamp < sessionStorage.getItem('timestamp');
                              },function(){
                                 posObj.summ.toCalculate();
                                 DOM.all();
                              });
                           
                           }
                        });
                     }
                  }
               });
               
               jQuery.extend(itemObj, viewEntyies);

               if(!isNaN(itemObj.alterQuantity())){
                  itemObj.toCalculate();
               }
               
               var flag = itemObj.checkPoint();
               if(flag!==true){
                  self.displayEntyies({display_title:itemObj.errorCode[flag]});
                  delete itemObj;
                  return;
               }
               
               var orisize = Object.size(posObj.orderlist);
               posObj.orderlist[itemObj.getproperties().spk] = itemObj;
               
               window.delayExecute(function(){
                  return Object.size(posObj.orderlist) !== orisize;
               },function(){
                  posObj.summ.toCalculate();
                  sessionStorage.setItem('focusItem', itemObj.getproperties().spk);
                  DOM.all();
               });
               
               //console.log(posObj.summ.getproperties().SpecialSales);
               
               $('#display_title').data('user', 0);
               
            }
         });
      },

      getItem: function(start, limit, class_id){
         var self = this;
         start = start || 0;
         limit = limit || $('td', $(drawTableId)).length+1;

         this.queryRange({
            start:start, 
            limit:limit, 
            where:{'item_class': class_id}
         },function(){
            if(this.data){
               self.showtable({
                  obj:$(drawTableId),
                  data:this.data,
                  start:start,
                  limit:limit,   
                  fn:'getItem',
                  action:'pickupItem'
               });
            }
         });
      },
      
      searchItem: function(start, limit, strNo){
          var self = this;
          start = start || 0;
          limit = limit || $('td', $(drawTableId)).length+1;
          if(typeof strNo==='undefined'){
            strNo = tmp_no;
          }else{
            tmp_no = strNo;
          }
          this.eraser().multipleSearch({start:start, limit:limit, no:strNo},function(){
             var itemData = this.data;
             if(itemData){
                if(itemData.length>1 || start !==0 ){
                   self.showtable({
                      obj:$(drawTableId),
                      data:itemData,
                      start:start,
                      limit:limit,
                      fn:'searchItem',
                      action:'pickupItem'
                   });
                }else if(itemData.length===1 && start ===0 ){
                  var itemObj = itemData.pop();
                  self.pickupItem(null, null, itemObj.id);
                }
             }else{
                self.displayEntyies({display_title:'查無此商品資料'});
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
}(window.pos));
