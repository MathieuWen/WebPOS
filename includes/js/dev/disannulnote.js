
jQuery.extend(window.pos, function(zpos){
   return {
      DisannulNote: function(){
         var self = this;
         
         var toReturn = function(json){
            view_paydefined.queryByCondition({
               condition:{'paytype': json.paytype}
            }, function(){
               if(this.data){
                  var payObj = this.data.pop();
                  if(!empty(payObj.returntype)){
                     sales_prepaid.toDeposit({
                        customer_id:dataObj.customer.id,
                        paytype: json.paytype,
                        prepaid_amount: json.paymentlist_amount
                     });            
                  }
               }
            });
         }
         
         var CreateReceipt = function(dataObj){
            var sumProp = zpos.summ.getproperties();
            window.sales_receipt.Replace({
               sales_spk: uniqid('DSR'),
               sales_no: dataObj.sales_no,
               store_id: dataObj.Config.store_id,
               station_no: dataObj.Config.station_no,
               table_id: dataObj.table,
               employee_id: dataObj.employee.id,
               employee_name: dataObj.employee.name,
               customer_id: dataObj.customer.id,
               customer_name: dataObj.customer.name,
               sales_taxid: sumProp.sales_taxid,
               creditcard_no: sumProp.creditcard_no,
               sales_amount: -1*sumProp.sales_amount,
               sales_expenses: -1*sumProp.sales_expenses,
               sales_point: -1*sumProp.sales_point,
               sales_tax: -1*sumProp.sales_tax,
               sales_exemption: -1*sumProp.sales_exemption,
               sales_total: -1*sumProp.sales_total,
               sales_plus: -1*sumProp.sales_plus,
               sales_discount: -1*sumProp.sales_discount,
               sales_excessivepayment: -1*sumProp.sales_excessivepayment,
               sales_allowance: -1*sumProp.sales_allowance,
               healthtax: 0,
               status: window.STATUSDISANNULSTUB,
               sales_count: sumProp.sales_count,
               customer_total: sumProp.customer_total,
               establishdate: sumProp.establishdate,
               debtdate: '{CURRENT_TIMESTAMP}',
               uby: dataObj.employee.name
            }, function(){
               if(this.data){
                  var orderList = zpos.orderlist;
                  for(var okey in orderList){
                     var itemProp = orderList[okey].getproperties();
                     window.sales_receiptlist.Replace({
                        saleslist_spk : uniqid('DSL'), 
                        store_id : dataObj.Config.store_id, 
                        station_no : dataObj.Config.station_no,	  
                        sales_no : dataObj.sales_no,
                        seq : itemProp.seq,
                        saleslist_tax : -1*itemProp.saleslist_tax,
                        item_id : itemProp.id, 
                        item_name : itemProp.name, 
                        item_salesprice : itemProp.saleprice,
                        saleslist_quantity : -1*itemProp.saleslist_quantity,
                        saleslist_amount : -1*itemProp.saleslist_amount,
                        saleslist_expenses : -1*itemProp.saleslist_expenses,
                        saleslist_point : -1*itemProp.saleslist_point,
                        saleslist_cost : itemProp.saleslist_cost,
                        healthtax : 0,
                        saleslist_exemption : -1*itemProp.saleslist_exemption,
                        saleslist_discount : -1*itemProp.saleslist_discount,
                        saleslist_allowance : -1*itemProp.saleslist_allowance,
                        saleslist_plus : -1*itemProp.saleslist_plus,
                        remark : itemProp.remark.txt,
                        addprice : itemProp.addprice,
                        status : window.STATUSDISANNULSTUB,
                        establishdate: '{CURRENT_TIMESTAMP}',
                        uby : dataObj.employee.name
                     });
                  }
               }
            });
         }

         var CreatePayment = function(dataObj){
            var payProp = zpos.paym.getproperties();
            window.sales_payment.Replace({
               payment_spk: uniqid('DSP'),
               store_id: dataObj.Config.store_id,
               station_no: dataObj.Config.station_no,
               sales_no: dataObj.sales_no,
               ord: payProp.ord,
               payment_amount: -1*payProp.payment_amount,
               payment_cashover: -1*payProp.payment_cashover,
               payment_remark: payProp.payment_remark,
               payment_count: -1*payProp.payment_count,
               establishdate: '{CURRENT_TIMESTAMP}',
               uby: dataObj.employee.name,
               status: window.STATUSDISANNULSTUB
            }, function(){
               if(this.data){
                  var payList = zpos.paylist;
                  for(var pkey in payList){
                     var paylistProp = payList[pkey].getproperties();
                     window.sales_paymentlist.Replace({
                        paymentlist_spk : uniqid('DSPL'), 
                        store_id : dataObj.Config.store_id, 
                        station_no : dataObj.Config.station_no,	  
                        sales_no : dataObj.sales_no,
                        seq : paylistProp.seq,
                        customer_id: empty(paylistProp.customer_id)? dataObj.customer.id: paylistProp.customer_id,
                        customer_name: empty(paylistProp.customer_name)? dataObj.customer.name: paylistProp.customer_name,
                        payno : paylistProp.payno, 
                        paytype : paylistProp.paytype, 
                        payname : paylistProp.payname,
                        curid : paylistProp.curid,
                        rate_id : paylistProp.rate_id,
                        paymentlist_amount : -1*paylistProp.paymentlist_amount,
                        paymentlist_count : -1*paylistProp.paymentlist_count,
                        paymentlist_remark : paylistProp.paymentlist_remark,
                        establishdate : '{CURRENT_TIMESTAMP}',
                        status : window.STATUSDISANNULSTUB,
                        uby : dataObj.employee.name
                     });
                     
                     if(!strcasecmp(paylistProp.paytype, window.TYPEDEPOSIT)){
                        toReturn({
                           paytype: paylistProp.paytype, 
                           paylist: paylistProp, 
                           dataObj:dataObj
                        });
                     }
                  }
               }
            });
         }

         var Config = JSON.parse(  localStorage.getItem('ZConfig') );
         var sales_no = sessionStorage.getItem('sales_no');
         var table = JSON.parse( sessionStorage.getItem('table') );
         var employee = JSON.parse(  sessionStorage.getItem('employee') );  
         var customer = JSON.parse(  sessionStorage.getItem('customer') );  

 
         CreateReceipt({
            Config:Config, 
            table:table.id, 
            employee:employee, 
            customer:customer, 
            sales_no:sales_no
         });
         
         CreatePayment({
            Config:Config,
            employee:employee,
            customer:customer,
            sales_no:sales_no
         });

      }
   };
}(window.pos));
