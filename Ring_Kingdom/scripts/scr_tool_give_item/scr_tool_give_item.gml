// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tool_give_item(){
	
	var rea_item_id = argument[0];
	var rea_player = argument[1];
	
	var arr_items = arr_team_m[rea_player, enu_team.item];
	var bol_present = false;
	for (var j = 0; j < scr_tool_a_len(arr_items); j += 1){
		if rea_item_id = arr_items[j, enu_team_item.itemid]{
			bol_present = true;
			arr_items[j, enu_team_item.count] += 1;
		}
	}
	if not(bol_present){
		var rea_len = scr_tool_a_len(arr_items);
		arr_items[rea_len, enu_team_item.itemid] = rea_item_id;
		arr_items[rea_len, enu_team_item.count] = 1;
	}
	arr_team_m[rea_player, enu_team.item] = arr_items;
}