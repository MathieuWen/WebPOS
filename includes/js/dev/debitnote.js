
jQuery.extend(window.pos, function(zpos){
   return {
      DebitNote: function(){
         var self = this;
         
         var CheckStatus = function(judge, local, global){
            //作廢:-7, 作廢存根:7, 已結帳:8, 結帳:14, 清帳:12, 收單:10, 退貨:9
            var system_status_array = JSON.parse(  localStorage.getItem('system_status') );
            judge = judge.toInt();
            for(var i = system_status_array.length-1; -1<i; i--){
               var system_status = system_status_array[i];
               if(!strcasecmp(judge, system_status.status_no.toInt())){
                  return !empty(system_status.isGlobalChange) ? global : local;
               }
            }
         }
   
         var CreateReceipt = function(dataObj){
            //var sales_spk = sessionStorage.getItem('sales_spk');
            var sumProp = zpos.summ.getproperties();
            var status = CheckStatus(sumProp.status, sumProp.status, dataObj.status);
            window.sales_receipt.Replace({
               sales_spk: sumProp.sales_spk,
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
               sales_amount: sumProp.sales_amount,
               sales_expenses: sumProp.sales_expenses,
               sales_point: sumProp.sales_point,
               sales_tax: sumProp.sales_tax,
               sales_exemption: sumProp.sales_exemption,
               sales_total: sumProp.sales_total,
               sales_plus: sumProp.sales_plus,
               sales_discount: sumProp.sales_discount,
               sales_excessivepayment: sumProp.sales_excessivepayment,
               sales_allowance: sumProp.sales_allowance,
               healthtax: 0,
               status: status,
               sales_count: sumProp.sales_count,
               customer_total: sumProp.customer_total,
               establishdate: sumProp.establishdate,
               debtdate: (!strcasecmp(dataObj.status, window.STATUSCHECKOUT))?'{CURRENT_TIMESTAMP}':'{NULL}',
               uby: dataObj.employee.name
            }, function(){
               if(this.data){
                  var orderList = zpos.orderlist;
                  for(var okey in orderList){
                     var itemProp = orderList[okey].getproperties();
                     var status = CheckStatus(itemProp.status, itemProp.status, dataObj.status);
                     window.sales_receiptlist.Replace({
                        saleslist_spk : itemProp.spk, 
                        store_id : dataObj.Config.store_id, 
                        station_no : dataObj.Config.station_no,	  
                        sales_no : dataObj.sales_no,
                        seq : itemProp.seq,
                        saleslist_tax : itemProp.saleslist_tax,
                        item_id : itemProp.id, 
                        item_name : itemProp.name, 
                        item_salesprice : itemProp.saleprice,
                        saleslist_quantity : itemProp.saleslist_quantity,
                        saleslist_amount : itemProp.saleslist_amount,
                        saleslist_expenses : itemProp.saleslist_expenses,
                        saleslist_point : itemProp.saleslist_point,
                        saleslist_cost : itemProp.saleslist_cost,
                        healthtax : 0,
                        saleslist_exemption : itemProp.saleslist_exemption,
                        saleslist_discount : itemProp.saleslist_discount,
                        saleslist_allowance : itemProp.saleslist_allowance,
                        saleslist_plus : itemProp.saleslist_plus,
                        remark : itemProp.remark.txt,
                        addprice : itemProp.addprice,
                        status : status,
                        establishdate: itemProp.establishdate,
                        isprinted: itemProp.isprinted,
                        uby : dataObj.employee.name
                     }, function(okey){
                        delete zpos.orderlist[okey];
                     }(okey));
                  }
               }
            });
         }

         var CreatePayment = function(dataObj){
            var payProp = zpos.paym.getproperties();
            if(empty(payProp.payment_amount))   return;
            var status = CheckStatus(payProp.status, payProp.status, dataObj.status);
            window.sales_payment.Replace({
               payment_spk: payProp.payment_spk,
               store_id: dataObj.Config.store_id,
               station_no: dataObj.Config.station_no,
               sales_no: dataObj.sales_no,
               ord: payProp.ord,
               payment_amount: payProp.payment_amount,
               payment_cashover: payProp.payment_cashover,
               payment_remark: payProp.payment_remark,
               payment_count: payProp.payment_count,
               establishdate: payProp.establishdate,
               uby: dataObj.employee.name,
               status: status
            }, function(){
               if(this.data){
                  var payList = zpos.paylist;
                  for(var pkey in payList){
                     var paylistProp = payList[pkey].getproperties();
                     var status = CheckStatus(paylistProp.status, paylistProp.status, dataObj.status);
                     window.sales_paymentlist.Replace({
                        paymentlist_spk : paylistProp.paymentlist_spk, 
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
                        paymentlist_amount : paylistProp.paymentlist_amount,
                        paymentlist_count : paylistProp.paymentlist_count,
                        paymentlist_remark : paylistProp.paymentlist_remark,
                        establishdate : paylistProp.establishdate,
                        status : status,
                        uby : dataObj.employee.name
                     }, function(pkey){
                        delete zpos.paylist[pkey];
                     }(pkey));
                  }
               }
            });
         }

         var Config = JSON.parse(  localStorage.getItem('ZConfig') );
         var sales_no = sessionStorage.getItem('sales_no');
         var table = JSON.parse( sessionStorage.getItem('table') );
         var employee = JSON.parse(  sessionStorage.getItem('employee') );  
         var customer = JSON.parse(  sessionStorage.getItem('customer') );  
         var status = sessionStorage.getItem('status');
         /*
         if(table!==undefined && status==='10'){
         //作廢:-7, 作廢存根:7, 已結帳:8, 結帳:14, 清帳:12, 收單:10, 退貨:9
            data_table.Update({index:table.id, active:1});
         }
         */
 
         CreateReceipt({
            Config:Config, 
            table:table.id, 
            employee:employee, 
            customer:customer, 
            sales_no:sales_no,
            status:status
         });
         
         CreatePayment({
            Config:Config,
            employee:employee,
            customer:customer, 
            sales_no:sales_no,
            status:status
         });
      }
   };
}(window.pos));
