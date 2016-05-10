<div id="right_box">
    <div id="group_list">
		<table id="grouplist_table">
			<?php for($y=0; $y<3; $y++):?>
			<tr>
				<?php for($x=0; $x<4; $x++):?>
					<td><div></div><input type="hidden"/></td>
				<?php endfor;?>
			</tr>
			<?php endfor;?>
		</table>
    </div>

    <div id="item_list">
        <table id="itemlist_table">
			<?php for($y=0; $y<7; $y++):?>
			<tr>
				<?php for($x=0; $x<4; $x++):?>
					<td class="itemlist_table_td"><div></div><input type="hidden"/></td>
				<?php endfor;?>
			</tr>
			<?php endfor;?>
        </table>
    </div>
</div>