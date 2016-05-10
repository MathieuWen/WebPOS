
var Item = function(itemObj, posObj){
   var item_name = '';
   var item_id = 0;
   var item_no = '';
   var item_class = 0;
   var spk = '';
   var seq = 1;
   var Config = {};
   var item_setting = {};
   var item_salesprice = 0;
   var cache_salesprice = 0;
   var item_cost = 0;
   var item_point = 0;
   var cache_point = 0;
   var item_discount = 0;
   var saleslist_amount = 0; //結帳金額
   var saleslist_quantity = 1;
   var saleslist_expenses = 0;
   var remark = {txt:'', list:{}};
   var addprice = 0;
   var saleslist_tax = 0;  
   var saleslist_exemption = 0;
   var saleslist_discount = 0;
   var saleslist_allowance = 0;
   var saleslist_plus = 0; // 加成 (服務費)
   var saleslist_cost = 0;
   var saleslist_point = 0;
   var establishdate = '';
   var status = 0;
   var isprinted = 0;
   var prev = false;
   //console.log(itemObj);
	(function(){
      item_name = itemObj.name;
      item_id = (itemObj.id).toInt();
      item_no = itemObj.no;
      item_cost = parseFloat(itemObj.cost);
      item_class = itemObj.item_class;
      Config = JSON.parse(  localStorage.getItem('ZConfig') );
      item_setting = {
         // 折扣flag
         discount: itemObj.discount.toBool(), 
         // 改價flag
         upprice: itemObj.upprice.toBool(), 
         // 服務費flag
         service: itemObj.service.toBool(), 
         // 計稅flag
         selltax: itemObj.selltax.toBool(),
         // 出單位置 ( device id)
         outputlist:itemObj.outputlist,   
         // 標籤
         label:itemObj.label
      };

      establishdate = itemObj.establishdate || (new Date()).getTime();
      seq = itemObj.seq || 1;
      spk = $.sha256( 'SL'+Config.store_id+Config.station_no+(new Date()).getTime() );
      cache_salesprice = item_salesprice = parseFloat(itemObj['saleprice'+Config.item_default_price]);
      cache_point = item_point = parseFloat(itemObj.point);
      if(Config.item_default_discountable.toBool() && item_setting.discount.toBool()){
         item_discount = parseFloat(Config.item_default_discount);
      }
      
	})();

	return {
      errorCode : ['輸入格式錯誤', '請輸入數字', '此商品無法折扣', '此商品無法改價', '此商品需消耗點數, 請先執行顧客查詢','顧客點數不足'],
      
      checkPoint : function(point){
         point = point || saleslist_quantity * item_point;
         if(point<0){
            var customer = JSON.parse(sessionStorage.getItem('customer'));
            if(empty(customer.id)){
               return 4;
            }else{
               if(customer.point<point){
                  return 5;
               }
            }
         }
         return true;
      },
      
      alterPrintstatus : function(flag){
         isprinted = isprinted.toInt();
         flag = flag.toInt();
         (!(isprinted&&flag)) && (isprinted += flag);
         
      },
      
      alterPriceflag : function(flag){
         cache_salesprice = parseFloat(itemObj['saleprice'+flag]);
         item_salesprice = parseFloat(itemObj['saleprice'+flag]);
         console.log(flag, parseFloat(itemObj['saleprice'+flag]));
         this.alterPrice(item_salesprice);
      },
      alterStatus : function(tmp_status){
         status = tmp_status;
      },
      // 改量
		alterQuantity : function(quantity){
         quantity = quantity || parseFloat((this.displayEntyies()).display_title);
         if(isNaN(quantity)||empty(quantity))  return 1;
         var flag = this.checkPoint(quantity*item_point);
         if(flag!==true)  return flag;
         saleslist_quantity = parseFloat(quantity);
         return this.toCalculate();
		},
		// 改折扣
      alterDiscount : function(discount){
         discount = discount || (this.displayEntyies()).display_title;
         if(isNaN(discount)||discount==='')  return 1;
         if(item_setting.discount){
            item_discount = parseFloat((new Number(parseFloat(discount)/100)).toFixed(2));
            return this.toCalculate();
         }else{
            return 2;
         }
      },
      // 改售價
      alterPrice : function(price){
         price = price || parseFloat((this.displayEntyies()).display_title);
         if(isNaN(price)||empty(price))  return 1;
         if(item_setting.upprice){
            item_salesprice = parseFloat(price);
            return this.toCalculate();
         }else{
            return 3;
         }        
      },
      // 改折讓
      alterAllowance : function(allowance){
         saleslist_allowance = parseFloat(allowance);
         return this.toCalculate();
      },
      
      alterGratis : function(){
         if(empty(item_salesprice)){
            item_salesprice = cache_salesprice;
            item_point = cache_point;
         }else{
            item_salesprice = 0;
            item_point = 0;
         }
         this.alterRemark({class_id:'0', id:'0', name:'贈品', price:'0.00', type:'-1'});
         return item_salesprice;
      },
      
		alterRemark : function(obj){
			var singular = function(obj){
				for(key in remark.list){
					if(obj.class_id===remark.list[key].class_id){
						delete remark.list[key];
					}
				}
				remark.list[obj.id] = obj;
			}
         
			var multiple = function(obj){
				remark.list[obj.id] = obj;
			}
			
			//if(typeof remark.list[obj.id] === 'undefined'){
			if(empty(remark.list[obj.id])){
				if(obj.type==='0'){
					singular(obj);
				}else if(obj.type==='1'){
					multiple(obj);
				}else if(obj.type==='-1'){
               for(key in remark.list){
                  delete remark.list[key];
               }
               remark.txt = '';
               singular(obj);
            }
			}else{
				delete remark.list[obj.id];
			}
			
			addprice = 0;
			var tmp_name = [];
			for(key in remark.list){
				addprice += parseInt(remark.list[key].price, 10);
				tmp_name.push(remark.list[key].name);
			}

			remark.txt = tmp_name.join(', ');
			return this.toCalculate();
		},

		getproperties : function(){
			return {   
            spk : spk,
            seq : seq,
            id : item_id,
            name : item_name,
            no : item_no,
            item_setting : item_setting,
            item_class : item_class,
            item_discount: item_discount,
            saleprice : item_salesprice,
            saleslist_quantity : saleslist_quantity,
            saleslist_amount : saleslist_amount,
            saleslist_tax : saleslist_tax,
            saleslist_exemption : saleslist_exemption,
            saleslist_discount : saleslist_discount,
            saleslist_allowance : saleslist_allowance,
            saleslist_plus : saleslist_plus,
            saleslist_cost : saleslist_cost,
            saleslist_point : saleslist_point,
            saleslist_expenses : saleslist_expenses,
            remark : remark,
            addprice : addprice,
            status : status,
            establishdate : establishdate,
            isprinted: isprinted,
            prev : prev
			};
		},
		
		toCalculate : function(){
         saleslist_quantity = parseFloat(saleslist_quantity);
         item_salesprice = parseFloat(item_salesprice);
         addprice = parseFloat(addprice);
         saleslist_plus = parseFloat(saleslist_plus);
         item_discount = parseFloat(item_discount);
         saleslist_discount = parseFloat(saleslist_discount);
         item_cost = parseFloat(item_cost);
         item_point = parseFloat(item_point);

         saleslist_amount = saleslist_quantity*item_salesprice;
         // 加值
         if(!empty(addprice)){
            saleslist_amount += saleslist_quantity*addprice;
         }
         // 加成(服務費)
         if(item_setting.service){
            saleslist_plus = (new Number(parseFloat(Config.tip) * saleslist_amount)).toFixed(2);
         }
         // 折扣金額
         if(empty(item_discount)){
            saleslist_discount = 0;
         }else{
            saleslist_discount = saleslist_amount*item_discount;
            saleslist_amount -= saleslist_discount;
         }
         // 加成加回總額
         saleslist_amount += parseFloat(saleslist_plus);
         // 折讓
         saleslist_amount -= saleslist_allowance;
         // 計稅
         if(item_setting.selltax){
            var tmp_expense = saleslist_amount / (1+parseFloat(Config.sales_taxrate));
            saleslist_tax = parseFloat(tmp_expense) * (parseFloat(Config.sales_taxrate));
            saleslist_expenses = (new Number(saleslist_amount - saleslist_tax)).toFixed(2);
            saleslist_tax = (new Number(saleslist_tax)).toFixed(2);
            
         // 不計稅
         }else{
            saleslist_expenses = (new Number(saleslist_amount)).toFixed(2);
            saleslist_exemption = (new Number(saleslist_expenses)).toFixed(2);
         }
         
         // 單筆結帳金額
         saleslist_amount = (new Number(saleslist_amount)).toFixed(2);
         
         // 銷貨成本
         saleslist_cost = (new Number(item_cost * saleslist_quantity)).toFixed(2);
         
         // 銷貨點數
         saleslist_point = saleslist_quantity * item_point;
         
         //posObj.summ.toCalculate(false);
         return this;
		},
      
      toRecover : function(receiptlistObj){
         spk = receiptlistObj.saleslist_spk;
         seq = receiptlistObj.seq;
         item_name = receiptlistObj.item_name;
         saleslist_tax = receiptlistObj.saleslist_tax;
         item_salesprice = parseFloat(receiptlistObj.item_salesprice),
         saleslist_amount = parseFloat(receiptlistObj.saleslist_amount),
         saleslist_exemption = parseFloat(receiptlistObj.saleslist_exemption),
         saleslist_expenses = parseFloat(receiptlistObj.saleslist_expenses);
         saleslist_quantity = parseFloat(receiptlistObj.saleslist_quantity);
         saleslist_point = parseFloat(receiptlistObj.saleslist_point);
         saleslist_cost = parseFloat(receiptlistObj.saleslist_cost);
         saleslist_discount = parseFloat(receiptlistObj.saleslist_discount);
         status = receiptlistObj.status.toInt();
         saleslist_allowance = parseFloat(receiptlistObj.saleslist_allowance);
         saleslist_plus = parseFloat(receiptlistObj.saleslist_plus);
         addprice = parseFloat(receiptlistObj.addprice);
         establishdate = receiptlistObj.establishdate;
         isprinted = receiptlistObj.isprinted.toInt();
         remark.txt = receiptlistObj.remark;
         prev = true;
         return this.toCalculate();
      }
	}
} 