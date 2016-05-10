<?php
//	define('DS', DIRECTORY_SEPARATOR);
//	define('ZPATH_BASE', str_replace('templates','', dirname(__FILE__)));
	include_once ZPATH_BASE.DS.'includes'.DS.'php'.DS.'defines.php';
	require_once ZPATH_LIBRARIES . DS . 'php'. DS .'database.php';
	require_once ZPATH_BASE.DS.'configuration.php';
	$ZDB = new ZDatabase();
?>

<div id="setting" style="display: none;">
	<div id="Config"><form name="Config_form" id="Config_form">
	<div style="display:none;">
		<input type="hidden" id="default_loading_Group" name="default_loading_Group" value="0"/>
		<input type="hidden" id="rate_id" name="rate_id" value="1"/>
		<input type="hidden" id="isalelength" name="isalelength" value="10"/>
		<input type="hidden" id="customer_birth_status" name="customer_birth_status" value="0"/>
		<input type="hidden" id="updatetotal" name="updatetotal" value="0"/>
	</div>
	<div id="tabs">
		<ul> 
			<li><a href="#tabs-1">參數設定</a></li> 
			<li><a href="#tabs-2">功能設定</a></li> 
			<li><a href="#tabs-3">硬體設備</a></li> 
			<li><a href="#tabs-4">列印裝置</a></li> 
		</ul> 
		<div id="tabs-1"> 
			<table>
				<tr>
					<td><label for="store_id">店別名稱</label></td>
					<td>
					<label class="custom-select">
					<select id="store_id" name="store_id" title="請選擇店別" disabled>
						<option value="">請選擇</option> 
						<?php
							$sql = "SELECT `store_id` AS id, `store_no` AS no, `store_name` AS name FROM `data_store`;";
							$result = $ZDB -> Zquery($sql);
							if($result){
								foreach($result as $key => $val){
									echo "<option value=\"{$val['id']}\">{$val['name']}</option>";
								}
							}
						?>
					</select>		
					</label>
					</td>
				</tr>
				<tr>
					<td><label for="station_no">網路站號</label></td>
					<td>
						<label class="custom-select">
						<select id="station_no" name="station_no" title="請選擇站號" disabled> 
							<option value="0">請選擇</option> 
						</select>
						</label>	
					</td>
				</tr>
				<tr>
					<td><label for="item_default_price">預設價位</label></td>
					<td>
						<label class="custom-select">
						<select id="item_default_price" name="item_default_price" title="請選擇價位"> 
							<option value="1" selected="true">1</option> 
							<option value="2">2</option> 
							<option value="3">3</option> 
						</select>
						</label>
					</td>
				</tr>
				<tr>
					<td><label for="curid">預設幣別</label></td>
					<td>
						<label class="custom-select">
						<select id="curid" name="curid" value="1" title="請選擇幣別">
							<?php
								$sql = "SELECT `curid` AS id, `curname` AS name FROM `trans_curid`;";
								$result = $ZDB -> Zquery($sql);
								if($result){
									foreach($result as $key => $val){
										echo "<option value=\"{$val['id']}\">{$val['name']}</option>";
									}
								}
							?>
						</select>		
						</label>
					</td>
				</tr>				
				<tr>
					<td><label for="sales_taxrate">營業稅率</label></td>
					<td><input type="text" name="sales_taxrate" id="sales_taxrate" class="number" value="5" title="請輸入營業稅率，台灣稅率為5%營業稅，則請輸入5，以此類推即可。"/></td>
				</tr>	
				<tr>
					<td><label for="tip">服務費率</label></td>
					<td>
						<input type="text" name="tip" id="tip" class="number" value="0" title="請輸入服務費率，如一成服務費則輸入10，以此類推即可。"/>
					</td>
				</tr>
				

				

				<tr>
					<td><label for="Cumulative_number_of_points">金額累積點數</label></td>
					<td>
						<input type="text" name="Cumulative_number_of_points" id="Cumulative_number_of_points" value="0" class="number" title="請輸入累積點數"/>
					</td>
				</tr>
				<tr>
					<td><label for="point_rate">點數扣抵金額</label></td>
					<td><input type="text" name="point_rate" id="point_rate" value="0" title="請輸入扣抵金額"/></td>
				</tr>
				<tr>
					<td><label for="opening_time">營業時段</label></td>
					<td>
						<!--input type="time" name="opening_time" id="opening_time" />&nbsp;至&nbsp;<input type="time" nae="closed_time" id="closed_time" /-->
						<input type="text" name="opening_time" id="opening_time" value="09:00-18:00" title="請輸入營業時段，如營業時間為早上9點至下午6點則輸入09：00-18：00，以此類推即可。"/>
					</td>
				</tr>
				<tr>
					<td><label for="quantity_round_off_to_the_n_decimal_place">數量小數<span id="quantity_round">0</span>位</label></td>
					<td>
						<div class="tabs-slider">
							<input type="range" name="quantity_round_off_to_the_n_decimal_place" id="quantity_round_off_to_the_n_decimal_place" value="0" min="0" max="5" step="1"></input>
						</div>
					</td>	
				</tr>
				
				<tr>
					<td><label for="amount_round_off_to_the_n_decimal_place">金額小數<span id="amount_round">0</span>位</label></td>
					<td>
						<div class="tabs-slider">
							<input type="range" name="amount_round_off_to_the_n_decimal_place" id="amount_round_off_to_the_n_decimal_place" value="0" min="0" max="5" step="1"></input>
						</div>
					</td>	
				</tr>				

				<tr>
					<td><label for="discount_no_point" id="laber_discount_points" class="label_radio">折扣計點數</label></td>
					<td>
						<div id="discount_no_point" class="tabs_radio"> 
							<input type="radio" id="discount_no_points_y" name="discount_no_points" value="true"/><label for="discount_no_points_y">是</label> 
							<input type="radio" id="discount_no_points_n" name="discount_no_points" value="false"/><label for="discount_no_points_n">否</label> 
						</div>					
					</td>
				</tr>
				<!--tr>
					<td><label for="item_defalut_discountable" id="laber_item_defalut_discountable" class="label_radio">自動折扣</label></td>
					<td>
						<div id="item_defalut_discountable" class="tabs_radio"> 
							<input type="radio" id="item_defalut_discountable_y" name="item_defalut_discountable" value="true"/><label for="item_defalut_discountable_y">是</label> 
							<input type="radio" id="item_defalut_discountable_n" name="item_defalut_discountable" value="false"/><label for="item_defalut_discountable_n">否</label> 
						</div>					
					</td>
				</tr-->
				<tr style="display:none;">
					<td><label for="item_defalut_discount" id="laber_item_defalut_discount">折扣率</label></td>
					<td>
						<input type="text" name="item_defalut_discount" id="item_defalut_discount" class="number" value="1" title=""/>
					</td>
				</tr>				
			</table>
		</div> 
		<div id="tabs-2"> 
			<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p> 
		</div> 
		<div id="tabs-3"> 
			<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p> 
			<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p> 
		</div> 	
		<div id="tabs-4"> 
			<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
		</div> 
	</div> 
	</form></div>
</div>