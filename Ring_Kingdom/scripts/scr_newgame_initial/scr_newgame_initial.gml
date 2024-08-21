// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_newgame_initial(){
	arr_team_m = noone;
	var rea_players = 12;
	
	for (var i = 0; i < rea_players; i += 1){
		for (var j = 0; j < enu_team.last; j += 1){
			arr_team_m[i,j] = noone;
		}
	}
	
	scr_tool_get_center_coo(true);

	
	
	for (var i = 0; i < rea_players; i += 1){
		for (var j = 0; j < enu_team.last; j += 1){
			if j = enu_team.name{
				arr_team_m[i,j] = arr_color[i, enu_color.name];
			}else if j = enu_team.color{
				arr_team_m[i,j] = arr_color[i, enu_color.color];
			}else if j = enu_team.intel1{
				if i = 0{
					arr_team_m[i,j] = enu_intel.human;
				}else{
					arr_team_m[i,j] = enu_intel.ai_easy;
				}
			}else if j = enu_team.shop{
				scr_eng_mv_setbuy_refreshshop(i);
			}else if j = enu_team.alive{
				arr_team_m[i,j] = true;
			}else if j = enu_team.item{
				var arr_items = noone;
				arr_items[0, enu_team_item.itemid] = enu_shop_item.mexhealth;
				arr_items[1, enu_team_item.itemid] = enu_shop_item.attack;
				arr_items[2, enu_team_item.itemid] = enu_shop_item.income;
				arr_items[3, enu_team_item.itemid] = enu_shop_item.regen;
				arr_items[4, enu_team_item.itemid] = enu_shop_item.range;
				for (var k = 0; k < scr_tool_a_len(arr_items); k += 1){
					arr_items[k, enu_team_item.count] = 1;
				}
				arr_team_m[i,j] = arr_items;
			}else if j = enu_team.cur_money{
				arr_team_m[i,j] = 30;
			}
		}	
		scr_eng_team_stats_calc(i, true);
	}

	scr_tool_get_team_coo();//teaam needs to be made
	scr_tool_get_center_coo(false); 
	
	scr_camera_scroll(arr_grphc[enu_grphc.guicenx],arr_grphc[enu_grphc.guiceny]);
	var rea_ideal_zoom = scr_tool_get_ideal_zoom();
	scr_camera_zoom(noone, rea_ideal_zoom);
	
	arr_wrkflw[enu_wrkflw.autorun] = false;
	arr_wrkflw[enu_wrkflw.cpturn] = 0;
	arr_wrkflw[enu_wrkflw.cycle] = 0;
	
	arr_team_f = arr_team_m;
	arr_team_a = arr_team_m;
	arr_team_p = arr_team_m;
	
	scr_eng_mv_new(noone); // to not carry over moves
}