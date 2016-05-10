<div id="left_box">
    <div id="display">
    	<div id="display_title" data-unlock="1" data-user="0">歡迎光臨</div>
      <div id="display_subtotal" data-unlock="1"></div>
      <div id="display_detail">
         <table>
            <tr>
               <td>顧客：<span id="customer" data-unlock="1"></span></td>
               <td>點數：<span id="point" data-unlock="1"></span></td>
               <td>餘額：<span id="deposit" data-unlock="1"></span></td>
               <td>統編：<span id="taxid" data-unlock="1"></span></td>
            </tr>
            <tr>
               <td>銷售：<span id="sale" data-unlock="1"></span></td>
               <td>員工：<span id="employee" data-unlock="1"></span></td>
               <td>設備：<span id="device" data-unlock="1"></span></td>
               <td>時間：<span id="time" data-unlock="1"></span></td>
            </tr>			
         </table>			
      </div>
    </div>
	
	<div id="order_list">
		<table class="order_thead">
			<tr>
            <th>序</th><th>商品名稱</th><th>數量</th><th>單價</th>
            <th>折扣</th><th>金額</th><th>備註</th><th id="toPrev"><span class="ui-icon ui-icon-triangle-1-n">&nbsp;</span></th>
         </tr>
		</table>
		<div class="order_tbody">
			<table id="order_table">
				<tbody></tbody>
			</table>
		</div>
		<table class="addition">
			<tr>
				<td><label>禮卷：</label></td><td><span id="addition_gift" data-unlock="1"></span></td>
				<td><label>折扣：</label></td><td><span id="addition_discount" data-unlock="1"></span></td>
				<td><label>加點：</label></td><td><span id="addition_point" data-unlock="1"></span></td>
            <td rowspan="2" id="toNext"><span class="ui-icon ui-icon-triangle-1-s">&nbsp;</span></td>
			</tr>
			<tr>
				<td><label>折讓：</label></td><td><span id="addition_allowance" data-unlock="1"></span></td>
				<td><label>服務費：</label></td><td><span id="addition_service" data-unlock="1"></span></td>
				<td><label>儲值：</label></td><td><span id="addition_charge" data-unlock="1"></span></td>
			</tr>
		</table>		
	</div>
	
	<div id="left_bottom">
	<table><tr>
		<td><div id="page">
			<ul id="tab">
				<li id="page_yellow" class="active"><div>常用</div></li>
				<li id="page_blue"><div>資料</div></li>
				<li id="page_green"><div>備份</div></li>
				<li id="page_red"><div>系統</div></li>
			</ul>
		</div></td>
		<td>
         <div id="function_page" class="fn_p1">
               <table id="function_table">
               <?php for($y=0; $y<4; $y++):?>
               <tr>
                  <?php for($x=0; $x<5; $x++):?>
                     <td><div></div><input type="hidden"/></td>
                  <?php endfor;?>
               </tr>
               <?php endfor;?>
            </table>
         </div>
      </td>
      <td>
         <div id="numpad" class="numpad">
            <table id="numpad_table">
               <tr><td class="num key7">7</td><td class="num key8">8</td><td class="num key9">9</td></tr>
               <tr><td class="num key4">4</td><td class="num key5">5</td><td class="num key6">6</td></tr>
               <tr><td class="num key1">1</td><td class="num key2">2</td><td class="num key3">3</td></tr>
               <tr><td class="num key0">0</td><td class="num key00">00</td><td class="num keyBS">←</td></tr>
            </table>
         </div>
      </td> 
      <td>
         <div id="focuspad" class="focuspad">
            <table id="focuspad_table">
               <tr><td class="subtotal" id="toSubtotal"><div>小計</div><input type="hidden"/></td></tr>
               <tr><td class="cash" id="toCash"><div>現金</div><input type="hidden"/></td></tr>
            </table>
         </div>
      </td>
	</tr></table>	
	</div>
</div>