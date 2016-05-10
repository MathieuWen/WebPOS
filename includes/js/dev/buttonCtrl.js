var windowLister = function(posObj){
   var zpos = posObj;
   var self = this;
   return {
      zpos: zpos
   }
}

window.ActionLister = new windowLister(window.pos);

jQuery.extend(window.ActionLister, viewEntyies, function(btnObj){
   var that = this['ActionLister'];
   $('#toPrev, #toNext, #toCash, #toSubtotal').on('click', function(){
      try{
         btnObj[$(this).attr('id')]();
      }catch(e){
         user_error('程式['+$(this).attr('id')+']出錯', 256);
      }finally{
         $('#display_title').data('user', 0);
      }
   });
   
   $(window).keyup(function(e){
      var keyNum = (window.event ? e.keyCode : e.which).toInt();
      if(keyNum===229)  return alert('請您關閉輸入法');
      if(keyNum===16) sessionStorage.setItem('locKeyBord', !(sessionStorage.getItem('locKeyBord').toBool()));
      if(keyNum > 47 && keyNum < 106 || keyNum == 8) return;
      if(sessionStorage.getItem('locKeyBord').toBool())  event.returnValue=false;
      btnObj.KeySwitcher(keyNum);
   });
   
   that.Config = JSON.parse(  localStorage.getItem('ZConfig') );
   
   return {
      KeySwitcher: function(keyNum){
         $('#display_title').data('user', 0);
        var self = this;
         window.view_program_assoc.KeySearch({associateKey:keyNum, transfer:'server'},function(){
            if(this.data){
               var func = this.data.pop();
               var funName = func.action;
               var funArgv = func.argv;
               var funContent = func.content;
               try{
                  if(method_exists('ActionLister', funName)){
                     self[funName](funArgv);
                  }else{
                     if(empty(funContent)){           
                        self.displayEntyies({display_title:'此程式尚未開通'});
                     }else{
                        console.log('Loading...\n Program name:'+funName);
                        jQuery.globalEval(funContent);
                        window.delayExecute(function(){
                           return method_exists('ActionLister', funName);
                        },function(){
                           self[funName](funArgv);
                        });
                     }
                  }
               }catch(e){
                  user_error('程式['+funName+']出錯', 256);
               }
            }
         });
      },
      
      empty : function(){
         var self = this;
         this.displayEntyies({display_title:'此按鍵尚未開通功能'});
         setTimeout(function(){
            self.displayEntyies({display_title:'歡迎光臨'});
         }, 1000);
      },
      
      toPrev : function(){
         var focusItem = sessionStorage.getItem('focusItem'), prev;
         if(empty(focusItem)){
            if($('#order_table tbody tr').length){
               prev = $('#order_table tbody tr:last').attr('id');
            }else{
               prev = '';
            }
         }else{
            prev = $('#'+focusItem).prev().attr('id') || $('#'+focusItem).parent().children(':last').attr('id');
         }
         
         sessionStorage.setItem('focusItem', prev);
         window.DOM.all();
      },    
      
      toNext : function(){
         var focusItem = sessionStorage.getItem('focusItem'), next;
         var tleng = $('#order_table tbody tr').length;
         if(empty(focusItem)){
            if(tleng){
               next = $('#order_table tbody tr:first').attr('id');
            }else{
               next ='';
            }
         }else{
            next = $('#'+focusItem).next().attr('id') || $('#'+focusItem).parent().children(':first').attr('id');
            //next = searchNext(leng, $('#'+focusItem).next().attr('id')) || $('#'+focusItem).parent().children(':first').attr('id');
         }
         
         sessionStorage.setItem('focusItem', next);
         window.DOM.all();
      },
      
      // 清除
      clearDisplayTitle : function(){
         this.displayEntyies({display_title:''});
      },
      
      alterQuantity : function(){
         var display_title = '數量變更完畢';
         var focusItem = sessionStorage.getItem('focusItem');
         if(empty(focusItem)){
            display_title = '請選擇一項商品';
         }else{
            var flag = this.zpos.orderlist[focusItem].alterQuantity();
            if(isNaN(flag)){
               window.DOM.all();
            }else{
               display_title = this.zpos.orderlist[focusItem].errorCode[flag];
            }
         }
         this.displayEntyies({display_title:display_title});
      },

      alterDiscount : function(){
         var display_title = '商品折扣確定';
         var focusItem = sessionStorage.getItem('focusItem');
         if(empty(focusItem)){
            var errcount = 0;
            for(key in this.zpos.orderlist){
               if(!isNaN(this.zpos.orderlist[key].alterDiscount())){
                  errcount++;
               }
            }
            window.DOM.all();
            if(errcount){
               var displayString = JSON.parse(sessionStorage.getItem('displayString'));
               display_title = '有'+errcount+'樣商品無法折扣!';
            }else{
               display_title = '請選擇欲折扣商品';
            }
         }else{
            var flag = this.zpos.orderlist[focusItem].alterDiscount();
            if(isNaN(flag)){
               window.DOM.all();
               this.zpos.summ.toCalculate();
            }else{
               display_title = this.zpos.orderlist[focusItem].errorCode[flag];
            }
         }
         this.displayEntyies({display_title:display_title});
      },
      
     alterPrice : function(){
         var display_title = '價格變更完畢';
         var focusItem = sessionStorage.getItem('focusItem');
         if(empty(focusItem)){
            display_title = '請選擇一項商品';
         }else{
            var flag = this.zpos.orderlist[focusItem].alterPrice();
            if(isNaN(flag)){
               window.DOM.all();
            }else{
               display_title = this.zpos.orderlist[focusItem].errorCode[flag];
            }
         }
         this.displayEntyies({display_title:display_title});
     },
     
     alterGratis : function(){
         var display_title = '變更為贈品';
         var focusItem = sessionStorage.getItem('focusItem');
         var orderlist = this.zpos.orderlist;
         if(empty(focusItem)){
            for(var key in orderlist){
               if(orderlist.hasOwnProperty(key)){
                  if(orderlist[key].alterGratis()){
                     display_title = '贈品取消';
                  }
               }
            }
         }else{
            if(orderlist[focusItem].alterGratis()){
               display_title = '贈品取消';
            }
         }
         window.DOM.all();
         this.displayEntyies({display_title:display_title});
     },
     
     alterRemark : function(){
         var display_title = '';
         var focusItem = sessionStorage.getItem('focusItem');
         if(empty(focusItem)){
            display_title = '請選擇一項商品';
         }else{
            var itemProp = this.zpos.orderlist[focusItem].getproperties();
            try{
               if(method_exists('view_remark_assoc', 'eraser')){
                  window.view_remark_assoc.eraser().getRemark(null, null, itemProp.item_class);
               }else{
                  throw new Error(JSON.stringify({
                     className:'view_remark_assoc',
                     method:'eraser',
                     callback:'ActionLister.alterRemark()'
                  }));
               }
            }catch(error){
               window.LoadScript(JSON.parse(error.message));
            }            
            window.DOM.all();
         }
         this.displayEntyies({display_title:display_title});
     },
     
      alterTaxid : function(){
         var display_title = '統一編號變更完畢';
         var flag = this.zpos.summ.alterTaxid();
         if(!isNaN(flag)){
            display_title = this.zpos.summ.errorCode[flag];
         }
         this.displayEntyies({display_title:display_title});
      },
      
      alterAllowance : function(allowance){
         if(!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)){
            var IdentityNO = window.PAYBYALLOWANCE;
            var self = this;
            allowance = allowance || (this.displayEntyies()).display_title;
            if(parseFloat(allowance)>parseFloat(that.Config.allowance_max)){
               return self.displayEntyies({display_title:'您已經超過折讓金額限制'});
            }
            if(allowance.match(/[\D]/ig)){
               return this.displayEntyies({display_title:'請輸入金額'});
            }else{
               var sumObj = self.zpos[!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)?'subsumm':'summ'];
               var oldallowance = sumObj.getproperties().sales_allowance;
               var oldamount = sumObj.getproperties().sales_amount;
               sumObj.alterAllowance(allowance);
               
               window.delayExecute(function(){
                  return strcasecmp(sumObj.getproperties().sales_allowance, oldallowance) && strcasecmp(oldamount, sumObj.getproperties().sales_amount);
               },function(){
                  try{
                     if(method_exists('view_paydefined', 'getReady')){
                        window.view_paydefined.pickupPay({IdentityNO:IdentityNO, payamount:allowance});
                     }else{
                        throw new Error(JSON.stringify({
                           className:'view_paydefined',
                           method:'getReady',
                           callback:'ActionLister.alterAllowance()'
                        }));
                     }
                  }catch(error){
                     window.LoadScript(JSON.parse(error.message));
                  }
               });
            }
         }else{
            var display_title = '折讓輸入完畢';
            var flag = this.zpos.summ.alterAllowance();
            if(isNaN(flag)){
               window.DOM.all();
            }else{
               display_title = this.zpos.summ.errorCode[flag];
            }
            this.displayEntyies({display_title:display_title});
         }
      },
     
      balanceFinance : function(){
         var self = this;
         var summProp = self.zpos[!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)?'subsumm':'summ'].getproperties();
         var paymProp = self.zpos.paym.getproperties();
         
         if(parseFloat(summProp.sales_amount)>parseFloat(that.Config.sales_max)){
            return self.displayEntyies({display_title:'您已經超過消費金額限制'});
         }
         
         if(!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)){
            var remainder = Math[that.Config.calculation](parseFloat(summProp.sales_amount)-parseFloat(paymProp.payment_amount))+parseFloat(summProp.sales_allowance);
         }else{
            var remainder = Math[that.Config.calculation](parseFloat(summProp.sales_amount)-parseFloat(paymProp.payment_amount));
         }
         //console.log(summProp.sales_amount, paymProp.payment_amount);
         var display_title = '謝謝光臨，歡迎再次光臨。';
         if(remainder>0){
            display_title='尚差'+remainder+'元';
            sessionStorage.setItem('timestamp', (new Date()).getTime());
         }else if(empty(remainder)){
            var status = (that.Config.ispaybillfirst.toBool())?window.STATUSCHECKING:window.STATUSCHECKOUT;
            window.print.Thermal_toPrint(status);
            window.print.Receipt_toPrint(status);
            //return;
            sessionStorage.setItem('status', status);
            var sales_allowance = parseFloat(summProp.sales_allowance);
            if(!empty(sales_allowance)){
               self.zpos.summ.alterAllowance(sales_allowance);
            }
            var payList = self.zpos.paylist;
            for(var key in payList){
               if(payList.hasOwnProperty(key)){
                  var paylistProp = payList[key].getproperties();
                  if( paylistProp.paymentlist_amount<0 && !paylistProp.returnable && paylistProp.returntype===0){
                     display_title = paylistProp.payname+Math.abs(paylistProp.paymentlist_amount)+'元';
                  }
               }
            }
            window.delayExecute(function(){
               return !strcasecmp(sessionStorage.getItem('status'), status);
            },function(){
               self.zpos.DebitNote();
            });

            var displayTimer = 0, timer = window.setInterval(function(){
               var display_subtotal = '　　　　　　　　　　　　　　　　　儲存中，系統將自動返回，請稍候‧‧‧';
               var i = displayTimer%display_subtotal.length;
               self.displayEntyies({display_subtotal: display_subtotal.substr(i, display_subtotal.length-i)});
               displayTimer++;
            }, 100);
         
            var  timeout=2;
            window.delayExecute(function(){
               return empty(Object.size(self.zpos.orderlist)+Object.size(self.zpos.paylist)+(timeout--));
            },function(){
               window.clearInterval(timer);
               self.zpos.init();
            }, 1000);
         }
         self.displayEntyies({display_title:display_title});
         
         $.getJSON(window.GUARDURL,{
            flag: 1, 
            table_id: (JSON.parse(sessionStorage.getItem('table'))).id,
            timestamp: (new Date()).getTime()
         },function(data){
            console.log(data);
            if(data.status==='00'){
               self.displayEntyies({display_title: '此手環未能開通，請先至後台建立好資料'});
            }
         });
      },
      
      tradeComplete : function(){
         var self = this;
         sessionStorage.setItem('status', window.STATUSCHECKOUT);
         window.delayExecute(function(){
            return !strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKOUT);
         },function(){
            self.zpos.DebitNote();
         });
         
         window.sales_paymentlist.changeStatus2checkOut();
         window.sales_payment.changeStatus2checkOut();
         
         $.getJSON(window.GUARDURL,{
            flag: 4,
            table_id: (JSON.parse(sessionStorage.getItem('table'))).id,
            timestamp: (new Date()).getTime()
         }, function(data){
             console.log(data);
            if(data.status==='00'){
               self.displayEntyies({display_title: '此手環未能開通，請先至後台建立好資料'});
            }
            var displayTimer = 0, timer = window.setInterval(function(){
               var display_subtotal = '　　　　　　　　　　　　　　　　　門禁卸載中，請稍候‧‧‧';
               var i = displayTimer%display_subtotal.length;
               self.displayEntyies({display_subtotal: display_subtotal.substr(i, display_subtotal.length-i)});
               displayTimer++;
            }, 100);
            var  timeout=2;
            window.delayExecute(function(){
               return empty(Object.size(self.zpos.orderlist)+Object.size(self.zpos.paylist)+(timeout--));
            },function(){
               window.clearInterval(timer);
               self.zpos.init();
            }, 1000);
         });
      },
      
      toCash : function(cash){
         var IdentityNO = window.PAYBYCASH;
         var self = this;
         cash = cash || (this.displayEntyies()).display_title;
         if(parseFloat(cash)>parseFloat(that.Config.sales_max)){
            return self.displayEntyies({display_title:'您已經超過消費金額限制'});
         }
         if(cash.match(/[\D]/ig)){
            return this.displayEntyies({display_title:'請輸入金額'});
         }else{
            try{
               if(method_exists('view_paydefined', 'getReady')){
                  window.view_paydefined.pickupPay({IdentityNO:IdentityNO, payamount:cash});
               }else{
                  throw new Error(JSON.stringify({
                     className:'view_paydefined',
                     method:'getReady',
                     callback:'ActionLister.toCash()'
                  }));
               }
            }catch(error){
               window.LoadScript(JSON.parse(error.message));
            }
         }
      },

     searchCustomer : function(){
         var display_title = (this.displayEntyies()).display_title;
         var tmp_title ='';
         var self = this;
         if(display_title.match(/[^\x00-\xff]/ig)){
            tmp_title = '請輸入顧客相關資料，例如電話號碼、手機號碼、生日等。';
         }else{
            try{
               if(method_exists('data_customer', 'getReady')){
                   window.data_customer.searchCustomer(null, null, display_title);
               }else{
                  throw new Error(JSON.stringify({
                     className:'data_customer',
                     method:'getReady',
                     callback:'ActionLister.searchCustomer()'
                  }));
               }
            }catch(error){
               window.LoadScript(JSON.parse(error.message));
            }
         }
         this.displayEntyies({display_title:tmp_title});
     },
     
     toDeposit : function(){
         var customer = JSON.parse(sessionStorage.getItem('customer'));
         var Orideposit = customer && customer.deposit;
         if(!!!Orideposit){
            return this.displayEntyies({display_title:'請先執行[顧客查詢]，取得顧客資料後，才可做儲值'});
         }
         var display_title = (this.displayEntyies()).display_title;
         var tmp_title = '';
         var self = this;
         if(display_title.match(/[\d]/ig)){
            window.sales_prepaid.toDeposit({
               customer_id:customer.id,
               paytype: window.TYPEDEPOSIT,
               prepaid_amount:display_title
            }, function(){
               if(this.data){
                  window.data_customer.pickupCustomer(null, null, customer.id);
                  window.delayExecute(function(){
                     var Newdeposit = (JSON.parse(sessionStorage.getItem('customer'))).deposit;
                     return Orideposit !== Newdeposit;
                  },function(){
                     var deposit = (new Number((JSON.parse(sessionStorage.getItem('customer'))).deposit)).toFixed();
                     self.displayEntyies({display_title: '成功儲進'+display_title+'元，共計'+deposit+'元', deposit:deposit});
                  });
               }
            });
         }else{
            this.displayEntyies({display_title:'請輸入要儲值的金額'});
         }
      
     },
     
      toWithDraw : function(){
         var customer = JSON.parse(sessionStorage.getItem('customer'));
         var Orideposit = customer && customer.deposit;
         if(!!!Orideposit){
            return this.displayEntyies({display_title:'請先執行[顧客查詢]，取得顧客資料後，才可做扣值'});
         }
         Orideposit = (JSON.parse(sessionStorage.getItem('customer'))).deposit;
         var display_title = (this.displayEntyies()).display_title;
         var tmp_title = '';
         var self = this;
               if(display_title.match(/[\d]/ig)){
                  window.sales_prepaid.toDraw({
                     customer_id:customer.id,
                     paytype: window.TYPEDEPOSIT,
                     prepaid_amount:display_title
                  }, function(){
                     if(this.data){
                        window.data_customer.pickupCustomer(null, null, customer.id);
                        window.delayExecute(function(){
                           var Newdeposit = (JSON.parse(sessionStorage.getItem('customer'))).deposit;
                           console.log(Orideposit, Newdeposit);
                           return Orideposit !== Newdeposit;
                        },function(){
                           var deposit = (new Number((JSON.parse(sessionStorage.getItem('customer'))))).toFixed();
                           var IdentityNO = window.PAYBYWITHDRAW;
                           var paypickup = JSON.stringify({IdentityNO:IdentityNO, payamount:parseFloat(display_title)});
                           var addition_charge = JSON.stringify({addition_charge:'-'+(new Number(display_title)).toFixed()});
                           //self.displayEntyies({addition_charge:deposit});
                           try{
                              if(method_exists('view_paydefined', 'pickupPay')){
                                 window.view_paydefined.pickupPay({IdentityNO:IdentityNO, payamount:parseFloat(display_title)});
                                 self.displayEntyies(addition_charge);
                              }else{
                                 throw new Error(JSON.stringify({
                                    className:'view_paydefined',
                                    method:'pickupPay',
                                    callback:'view_paydefined.pickupPay('+paypickup+'), ActionLister.displayEntyies('+addition_charge+');'
                                 }));
                              }
                           }catch(error){
                              window.LoadScript(JSON.parse(error.message));
                           }
                        });  
                     }
                  });
               }else{
                  this.displayEntyies({display_title:'請輸入要儲值的金額'});
               }
            

         
      },
      
      // 退貨作業
      toReturn : function(){
         var focusItem = sessionStorage.getItem('focusItem');
         var tmp_title = '';
         if(empty(focusItem)){
            tmp_title = '請選擇一項商品';
         }else{
            var display_title = (this.displayEntyies()).display_title;
            var Oriquantity = display_title.match(/[\d]/ig)?parseFloat(display_title):(this.zpos.orderlist[focusItem].getproperties()).saleslist_quantity;
            var flag = this.zpos.orderlist[focusItem].alterQuantity(-1*Oriquantity).alterStatus(9);
            if(isNaN(flag)){
               window.DOM.all();
            }else{
               tmp_title = this.zpos.orderlist[focusItem].errorCode[flag];
            }
         }
         this.displayEntyies({display_title:tmp_title});
      },
     
     //  收單作業
      toReceivedOrder : function(){
         var self = this;
         window.print.Thermal_toPrint(window.STATUSRECEIVEDORDER);
         window.print.Receipt_toPrint(window.STATUSRECEIVEDORDER);
         sessionStorage.setItem('status', window.STATUSRECEIVEDORDER);
         window.delayExecute(function(){
            return !strcasecmp(sessionStorage.getItem('status'), window.STATUSRECEIVEDORDER);
         },function(){
            self.zpos.DebitNote();
         });
         
         var timer = window.setInterval(function(){
            var display_title = '資料儲存中，請稍候';
            var display_dot = ['‧', '‧‧', '‧‧‧', '‧‧‧‧', '‧‧‧‧‧'];
            var next = (self.displayEntyies().display_title.length+1)%5;
            self.displayEntyies({display_title: display_title+display_dot[next]});
         }, 100);
         
         var timeout = 1;
         window.delayExecute(function(){
            return empty((timeout--));
         },function(){
            window.clearInterval(timer);
            self.zpos.init();
         }, 1000);
      },
     //  續單作業
      toRenewalOrder : function(){
         this.zpos.init();
      },
     //  作廢作業
     toDisannulOrder : function(){
         var display_title = (this.displayEntyies()).display_title;
         var self = this;
         if(isNaN(display_title)){
            this.displayEntyies({display_title:'請先輸入銷售編號'});
         }else{
            var sales_no = str_pad(display_title.toInt(), 8, '0', 'STR_PAD_LEFT');
            var station_no = (JSON.parse(localStorage.getItem('station'))).station_no;
            window.sales_receipt.queryByCondition({
               condition:{'sales_no':sales_no, 'store_id':that.Config.store_id, 'station_no':station_no}
            },function(){
               if(this.data){
                  var dataObj = this.data.pop();
                  var timestamp = sessionStorage.getItem('timestamp');
                  self.zpos.purchaseStart(function(){
                     sessionStorage.setItem('sales_no', dataObj.sales_no);
                     return {'station_no': dataObj.station_no};
                  }());
 
                  window.delayExecute(function(){
                     return strcasecmp(sessionStorage.getItem('timestamp'), timestamp)===1;
                  },function(){
                     if(confirm('您確定要作廢此筆交易?')){
                        self.zpos.unlock();
                        sessionStorage.setItem('status', window.STATUSDISANNUL);
                        self.zpos.DisannulNote();
                        setTimeout(function(){
                           self.zpos.DebitNote();
                        }, 500);
                        
                        window.delayExecute(function(){
                           return empty(Object.size(self.zpos.orderlist)+Object.size(self.zpos.paylist));
                        },function(){
                           self.zpos.init();
                        });
                     }else{
                        self.zpos.init();
                     }
                  }, 500);
               }else{
                  self.displayEntyies({display_title:'找無此編號的銷售單據'});
               }
            });
         }
     },
     
     searchItem : function(){
         var display_title = (this.displayEntyies()).display_title;
         var tmp_title ='';
         var self = this;
         if(display_title.match(/[^\x00-\xff]/ig)){
            tmp_title = '請輸入商品相關資料';
         }else{
            window.data_item.searchItem(null, null, display_title);
         }
         this.displayEntyies({display_title:tmp_title});
     },
     
     removeSalesList : function(){
         var display_title = '更正完畢';
         var focusItem = sessionStorage.getItem('focusItem');
         if(empty($('#'+focusItem).length))   return;
         if(empty(focusItem)){
            display_title = '請選擇一項商品';
         }else{
            if($('#'+focusItem).attr('class').indexOf('prev')>-1){
               display_title = '此筆為歷史紀錄，不可刪除'; 
            }else{
               if(confirm('您確定要刪除此筆?')){
                  this[$('tbody tr', $('#order_table')).index($('#'+focusItem))?'toPrev':'toNext']();
                  delete this.zpos.orderlist[focusItem];
                  this.zpos.summ.toCalculate();
                  window.DOM.all();
               }else{
                  display_title = '更正取消';
               }
            }
         }
         this.displayEntyies({display_title:display_title});
     },
     
     toSubtotal : function(){
         var display_title = '';
         sessionStorage.setItem('focusItem', '');
         try{
            if(method_exists('view_remark_assoc', 'eraser')){
               window.view_remark_assoc.eraser();
            }else{
               throw new Error(JSON.stringify({
                  className:'view_remark_assoc',
                  method:'eraser',
                  callback:'ActionLister.toSubtotal()'
               }));
            }
         }catch(error){
            window.LoadScript(JSON.parse(error.message));
         }
         window.DOM.all();
         
         var summProp = this.zpos[!strcasecmp(sessionStorage.getItem('status'), window.STATUSCHECKING)?'subsumm':'summ'].getproperties();
         var paymProp = this.zpos.paym.getproperties();              
         var remainder = Math[that.Config.calculation](parseFloat(summProp.sales_amount)-parseFloat(paymProp.payment_amount));
         var payamount = Math[that.Config.calculation](parseFloat(paymProp.payment_amount));
         if(empty(payamount)){
            display_title = this.displayEntyies().display_subtotal;
         }else{
            display_title = this.displayEntyies().display_subtotal+'，已付'+payamount+'元，尚差'+remainder+'元';
         }
         this.displayEntyies({display_title:display_title, display_subtotal:''});
         
     },
          
     reversalContract : function(){
         var self = this;
         if(confirm('您確定要取消交易?')){
            var restoreDeposit = function(){
               var payList = self.zpos.paylist;
               var sumPay = 0;
               for(key in payList){
                  if(payList.hasOwnProperty(key)){
                     var paylistProp = payList[key].getproperties();
                     if( paylistProp.paytype === 7 || paylistProp.paytype === 16 ){
                        sumPay += parseFloat(paylistProp.paymentlist_amount);
                     }
                  }
               }
               if(!empty(sumPay)){
                  var customer = JSON.parse(sessionStorage.getItem('customer'));
                  var prepaid = {customer_id:customer.id, paytype:'money', prepaid_amount:sumPay};
                  try{
                     if(method_exists('sales_prepaid', 'toDeposit')){
                        window.sales_prepaid.toDeposit(prepaid);
                     }else{
                        throw new Error(JSON.stringify({
                           className:'sales_prepaid',
                           method:'toDeposit',
                           callback:'sales_prepaid.toDeposit('+JSON.stringify(prepaid)+'), window.pos.init();'
                        }));
                     }         
                  }catch(error){
                     window.LoadScript(JSON.parse(error.message));
                  }
               }
            }
            
            if(isset(this.zpos.paylist[window.PAYBYWITHDRAW])){
               restoreDeposit();
            }
            
            this.zpos.init();
         }else{
            this.displayEntyies({display_title:'繼續交易'});
         }
     },
     
     logoutSystem : function(){
         if(confirm('您確定要登出?')){
            this.zpos.unlock();
            location.replace('./logout.php?'+(new Date()).getTime());
         }else{
            this.displayEntyies({display_title:'取消登出'});
         }         
     }
     
   }
}(window.ActionLister));

jQuery.extend(window.ActionLister, function(btnObj){
   var PanelObj = '#numpad_table';
    
   $(window).keydown(function(e){
      var keyNum = (window.event ? e.keyCode : e.which).toInt();
      if(sessionStorage.getItem('locKeyBord').toBool())  event.returnValue=false;
      switch(true){
         // 數字鍵
         case keyNum > 95 && keyNum < 106:
         case keyNum > 47 && keyNum < 58:
            btnObj.keyAppend(keyNum-((keyNum>95)?96:48));
         break;
         
         // 英文鍵
         case keyNum > 64 && keyNum < 91:
            btnObj.keyAppend(String.fromCharCode(keyNum));
         break;
         
         //backspace
         case keyNum == 8:
            btnObj.keyBackspace();
         break;
      }
   });

   $(PanelObj).on('click', 'td.num:not(.subtotal, .cash, .keyBS)',function(){
      btnObj.keyAppend($(this).text());
   });
   
   $(PanelObj).on('click', 'td.keyBS',function(){
      btnObj.keyBackspace();
   });

   return {
      keyAppend : function(enterStr){
         var pattern = new RegExp('[\x00-\xff]', 'ig');
         var format = arguments[1] || false;
         var display_title = (this.displayEntyies()).display_title;
         //display_title.match(pattern) || 
         if(!$('#display_title').data('user')){
            display_title = '';
            $('#display_title').data('user', 1);
         }
         
         display_title = display_title.concat(enterStr);
         if( !display_title.match(pattern)) return;
         this.displayEntyies({display_title:display_title});
      },
      
      keyBackspace : function(){
         var display_title = (this.displayEntyies()).display_title;
         display_title = display_title.substr(0, display_title.length-1);
         this.displayEntyies({display_title:display_title});
      }
   }
}(window.ActionLister));