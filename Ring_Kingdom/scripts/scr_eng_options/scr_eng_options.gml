// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_options(){
	
	var rea_mvtype = argument[0]
	var arr_options = noone;
	
	if rea_mvtype = enu_mvtype.atck {
		for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
			var rea_dis = scr_tool_get_range(i, arr_wrkflw[enu_wrkflw.cpturn])
			var bol_in_range =  rea_dis <= arr_team_m[arr_wrkflw[enu_wrkflw.cpturn]][enu_team.range];
			//I: used to have "and (i <> arr_wrkflw[enu_wrkflw.cpturn])" - [put back in to stop friendly attacks
			if (arr_team_m[i, enu_team.alive]) and bol_in_range{
				arr_options[scr_tool_a_len(arr_options)] = i;
			}
		}
	}
	if rea_mvtype = enu_mvtype.shop {
		var arr_shop = arr_team_m[arr_wrkflw[enu_wrkflw.cpturn], enu_team.shop];
		for (var i = 0; i < scr_tool_a_len(arr_shop); i += 1){
			if arr_team_m[arr_wrkflw[enu_wrkflw.cpturn], enu_team.cur_money] >= arr_shop_items[arr_shop[i], enu_shop_prop.cost]{
				arr_options[scr_tool_a_len(arr_options)] = i;
			}
		}
	}
	if rea_mvtype = enu_mvtype.dipr {
		
	}
	if rea_mvtype = enu_mvtype.dips {
		
	}
	return arr_options;
}