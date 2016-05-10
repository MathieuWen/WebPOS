var specialsales = function(posObj){
   var self = this; 
   self.SpecialSales = {};
   self.SpecialSalesentyiesQuantity = {};
   self.SpecialSalesentyiesAmount = {};
   self.SpecialSalesentyiesPoint = {};
   self.SpecialSalesentyiesTime = {};
      
   self.setSpecialSales = function(rule, specialObj){
      var tmp = {};
      for(var key in specialObj){
         if(specialObj.hasOwnProperty(key)){
            tmp[specialObj[key].item_id] = specialObj[key];
         }
      }
      self.SpecialSales[rule] = tmp;
      sessionStorage.setItem('timestamp', (new Date()).getTime());
   }

   self.toCalculate = function(){
      self.SpecialSalesentyiesQuantity = {}, self.SpecialSalesentyiesTime = {};
      var qtmp = {}, atmp={}, ptmp = {};
      for(var key in posObj.orderlist){
         if(posObj.orderlist.hasOwnProperty(key)){
            var itemProp = posObj.orderlist[key].getproperties();
            if(!!qtmp[itemProp.id]){
               qtmp[itemProp.id] += parseFloat(itemProp.saleslist_quantity);
               atmp[itemProp.id] += parseFloat(itemProp.saleslist_amount);
               ptmp[itemProp.id] += parseFloat(itemProp.saleslist_point);
            }else{
               qtmp[itemProp.id] = parseFloat(itemProp.saleslist_quantity);
               atmp[itemProp.id] = parseFloat(itemProp.saleslist_amount);
               ptmp[itemProp.id] = parseFloat(itemProp.saleslist_point);
            }
            
            self.SpecialSalesentyiesTime[key] = itemProp.establishdate;
         }
      }
      self.SpecialSalesentyiesQuantity = qtmp;
      self.SpecialSalesentyiesAmount = atmp;
      self.SpecialSalesentyiesPoint = ptmp;
      return self.SpecialPurchase();
   }

   self.SpecialPurchase = function(){
      var self = this;
      var customerJudge = function(rules){
         var customer = JSON.parse(sessionStorage.getItem('customer'));
         var clevel = customer.level.toInt(), rlevel = rules.require_customer_level.toInt();
         return (empty(customer.id) && isNaN(rules.require_customer_level) && clevel < rlevel ) ? false: true;
      }
      var timeJudge = function(rules){
         var now = (self.displayEntyies()).time;
         var start = Date.parse(now.substr(0, 11)+rules.time_start);
         now = Date.parse(now);
         var end = start+rules.time_end.toInt()*1000;
         return ( start<=now && 0<=(end-now) )? true: false;
      }
      var toAssignJob = function(rules){
         //console.log(rules);
         var flag = (new String()).concat(rules.flag_integratedGift, rules.flag_individual_alterPrice, rules.flag_individual_alterDiscount, rules.flag_individual_item_price_flag, rules.flag_integratedAllowance);
         var alterStatus = {
            16:{action:'toGift', key:'special_rule_index'}, 
            8:{action:'alterPrice', key:'alterPrice'}, 
            4:{action:'alterDiscount', key:'alterDiscount'}, 
            2:{action:'alterPriceflag', key:'item_price_flag'},
            1:{action:'alterAllowance', key:'allowance'}
         };
         
         self.alterItemStatus(alterStatus[parseInt(flag, 2)].action, {
            amount:rules[alterStatus[parseInt(flag, 2)].key], 
            item_id: rules.item_id.toInt(), 
            individual:rules.individual
         });
      }
      var totalAmountJudge = function(rules){
         return (parseFloat(rules.require_amount)<=sales_amount && sales_amount!==0 && !isNaN(rules.require_amount) )? true: false;
      }
      var individualQuantityJudge = function(rules){
         return (SpecialSalesentyiesQuantity[rules.item_id]>=parseFloat(rules.require_min_quantity)&&!isNaN(rules.require_min_quantity))? true: false;
      }
      var individualTimeoutJudge = function(rules){
         var now = Date.parse((self.displayEntyies()).time);
         return ((Date.parse(SpecialSalesentyiesTime[rules.item_id])-now)>rules.timeout.toInt()&&!isNaN(rules.timeout))? true: false;
      }
         for(var key in SpecialSales){
            if(SpecialSales.hasOwnProperty(key)){
               var list = SpecialSales[key];
               var vflag = 0, flags = 0;
               for(var item_id in list){
                  if(list.hasOwnProperty(item_id)){
                     var rules = list[item_id];
                     var flag = parseInt((new String()).concat(rules.flag_individualTimeout, rules.flag_individual_min_quantity, rules.flag_integratedCustomerLevel, rules.flag_integratedTime, rules.flag_integratedAmount), 2);
                      //  console.log(flag);
                     switch(flag){
                        case 16: // 時限
                              if(individualTimeoutJudge(rules)){vflag=1;}
                           break;
                        case 12: // 顧客等級+(單一)商品數量
                              if(customerJudge(rules)&&individualQuantityJudge(rules)){vflag=1;}
                           break;
                        case 10: // 時間+(單一)商品數量
                              if(timeJudge(rules)&&individualQuantityJudge(rules)){vflag=1;}
                           break;                           
                        case 8:  // (單一)商品數量
                              if(individualQuantityJudge(rules)){vflag=1;}
                           break;
                        case 7:  // 總金額+時間+顧客等級
                              if(totalAmountJudge(rules)&&timeJudge(rules)&&customerJudge(rules)){vflag=1;}
                           break;
                        case 6:  // 時間+顧客等級
                              if(timeJudge(rules)&&customerJudge(rules)){vflag=1;}
                           break;
                        case 5:  // 總金額+顧客等級
                              if(totalAmountJudge(rules)&&customerJudge(rules)){vflag=1;}
                           break;
                        case 4:  // 顧客等級
                              if(customerJudge(rules)){vflag=1;}
                           break;
                        case 3:  // 總金額+時間
                              if(totalAmountJudge(rules)&&timeJudge(rules)){vflag=1;}
                           break;
                        case 2:  // 時間判斷
                              if(timeJudge(rules)){vflag=1;}
                           break;
                        case 1:  // 總金額判斷
                              if(totalAmountJudge(rules)){vflag=1;}
                           break;
                     }
                     
                     flags += vflag;
                     var flag_integrated = rules.flag_integrated.toBool();
                     //console.log(flag_integrated, flags, Object.size(list));
                     if(flag_integrated&&flags ===Object.size(list)){
                        toAssignJob(rules);
                     }else if(vflag&&!flag_integrated){
                        toAssignJob(rules);
                     }
                  }
                  vflag = 0;
               }
            }
         }
      return posObj.summ.toCalculate();
   }
   
   self.alterItemStatus = function(alterStatus, factor){
      //console.log(status);
      var individual = factor.individual.toBool();
      if(individual){
         for(var key in posObj.orderlist){
            if(posObj.orderlist.hasOwnProperty(key)){
               var itemProp = posObj.orderlist[key].getproperties();
               if(itemProp.id===factor.item_id){
                  posObj.orderlist[key][alterStatus](factor.amount);
               }
            }
         }
      }else if(individual===0){
         this[alterStatus](factor.amount);
      }
   }
}