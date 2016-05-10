
window.data_customer = new database({
   tbname : 'data_customer',
   index : 'customer_id',
   no : 'customer_no',
   clumn : {
      'customer_id' : 'id', 
      'customer_no' : 'no', 
      'customer_name' : 'name', 
      'customer_sex' : 'sex', 
      'customer_password' : 'pass',
      'customer_ip' : 'ip',
      'customer_tel' : 'tel',
      'customer_fax' : 'fax',
      'customer_mobile' : 'birth',
      'customer_email' : 'email',
      'customer_address' : 'addr',
      'customer_birthday' : 'birth',
      'customer_level' : 'level',
      'customer_class' : 'class',
      'customer_point' : 'point',
      'customer_deposit' : 'deposit',
      'customer_group' : 'group',
      'customer_remark' : 'remark',
      'uby' : 'uby'
   },
   start : 1,
   limit : 12,
   orderclumn: 'customer_no',
   where : 'customer_name <> ""'
});

jQuery.extend(window.data_customer, function(data_obj){
    var dbProp = data_obj.getproperties();
    return {
       multipleSearch : function(parameter, fn){
            var transfer = parameter.transfer || dbProp.defaultTransfer;
            var sql = "SELECT "+dbProp.sclumn+" FROM `"+dbProp.tbname+"` "+dbProp.swhere+" AND (UCASE(customer_no) LIKE '"+parameter.no+"%' OR REPLACE(customer_tel,\'-\',\'\') LIKE '"+parameter.no+"%' OR REPLACE(customer_mobile,\'-\',\'\') LIKE '"+parameter.no+"%' OR REPLACE(customer_birthday,\'-\',\'\') LIKE '"+parameter.no+"%') ORDER BY "+dbProp.orderclumn+" "+dbProp.orderby+" LIMIT "+parameter.start+","+parameter.limit+";";
            this[transfer+'Query'](sql, fn);
       }
   };
}(window.data_customer)); 

jQuery.extend(window.data_customer, viewTable, viewEntyies, {
   getReady : function(){
      console.log('data_customer is ready');
   },
   
   pickupCustomer: function(){
      var self = this;
      var id = arguments[2];
      this.queryById({id:id, transfer:'server'},function(){
         if(this.data){
            var CustmoerObj = this.data.pop();
            sessionStorage.setItem('customer', JSON.stringify(CustmoerObj));
            self.displayEntyies({display_title:CustmoerObj.name+'您好', customer:CustmoerObj.name, point:CustmoerObj.point, deposit:CustmoerObj.deposit});
            self.eraser();
         }	  
      }); 
   },
   
   searchCustomer: function(start, limit, strNo){
      var self = this;
      start = start || 0;
      limit = limit || $('#itemlist_table td').length+1;
      this.eraser().multipleSearch({start:start, limit:limit, no:strNo, transfer:'server'},function(){
         var CustmoerData = this.data;
         if(CustmoerData){
            if(CustmoerData.length>1 || start !==0 ){
               self.showtable({
                  obj:$('#itemlist_table'),
                  data:CustmoerData,
                  start:start,
                  limit:limit,
                  fn:'searchCustomer',
                  action:'pickupCustomer'
               });
            }else{
               var CustmoerObj = CustmoerData.pop();
               sessionStorage.setItem('customer', JSON.stringify(CustmoerObj));
               self.displayEntyies({display_title:CustmoerObj.name+'您好', customer:CustmoerObj.name, point:CustmoerObj.point, deposit:CustmoerObj.deposit});
            }
         }else{
            self.displayEntyies({display_title:'查無此顧客資料'});
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
