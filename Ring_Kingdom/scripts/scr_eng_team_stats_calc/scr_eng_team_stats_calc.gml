// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_team_stats_calc(){
	var rea_tea = argument[0];
	var bol_initial = argument[1];
	arr_team_m[rea_tea,enu_team.max_health] = 5;
	arr_team_m[rea_tea,enu_team.damage] = 2;
	if bol_initial{
		arr_team_m[rea_tea,enu_team.cur_health] = arr_team_m[rea_tea,enu_team.max_health];
	}
	
	arr_team_m[rea_tea,enu_team.damage] = 0;
	arr_team_m[rea_tea,enu_team.attacks] = 1;
	arr_team_m[rea_tea,enu_team.armor] = 0;
	arr_team_m[rea_tea,enu_team.regen] = 0;
	arr_team_m[rea_tea,enu_team.max_health] = 0;
	arr_team_m[rea_tea, enu_team.range] = 0;
	arr_team_m[rea_tea, enu_team.inc_money] = 0;
	if arr_dev[enu_dev.easy] {
		if arr_team_m[rea_tea,enu_team.intel1] = enu_intel.human{
			arr_team_m[rea_tea,enu_team.max_health] = 20;
			arr_team_m[rea_tea,enu_team.max_health] = 100;
		
		}
	}
	
	var arr_items = arr_team_m[rea_tea,enu_team.item];
	for (var i = 0; i < scr_tool_a_len(arr_items); i += 1){
		if arr_items[i, enu_team_item.itemid] = enu_shop_item.range{
			arr_team_m[rea_tea, enu_team.range] = arr_items[i, enu_team_item.count];
		}
		if arr_items[i, enu_team_item.itemid] = enu_shop_item.attack{
			arr_team_m[rea_tea, enu_team.damage] = arr_items[i, enu_team_item.count];
		}
		if arr_items[i, enu_team_item.itemid] = enu_shop_item.regen{
			arr_team_m[rea_tea, enu_team.regen] = arr_items[i, enu_team_item.count];
		}
		if arr_items[i, enu_team_item.itemid] = enu_shop_item.income{
			arr_team_m[rea_tea, enu_team.inc_money] = arr_items[i, enu_team_item.count];
		}
		if arr_items[i, enu_team_item.itemid] = enu_shop_item.defence{
			arr_team_m[rea_tea, enu_team.armor] = arr_items[i, enu_team_item.count];
		}
		if arr_items[i, enu_team_item.itemid] = enu_shop_item.mexhealth{
			arr_team_m[rea_tea, enu_team.max_health] = arr_items[i, enu_team_item.count]*5;
		}
	}
	
	arr_team_m[rea_tea, enu_team.vision] = arr_team_m[rea_tea, enu_team.range];
	
}