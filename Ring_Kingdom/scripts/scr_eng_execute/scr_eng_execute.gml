// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_execute(){
	var rea_move_type = argument[0];
	var rea_player = argument[1];
	//arr_team_m[rea_cp, enu_team.cur_health] += +1;
	
	if rea_move_type = enu_mvtype.atck{
		var bol_newdeath = false;
		for (var i = 0; i < scr_tool_a_len(arr_moves[rea_player][enu_mvtype.atck]); i += 1){
			var arr_mvatt = arr_moves[rea_player][enu_mvtype.atck][i];
			//Normal attack
			if arr_mvatt[enu_mv_att.exestatus] = enu_exestatus.notcomplete{
				if rea_player <> arr_mvatt[enu_mv_att.target]{
					var rea_damage = max(arr_team_m[rea_player, enu_team.damage] - arr_team_m[arr_mvatt[enu_mv_att.target], enu_team.armor],1);
					arr_moves[rea_player][enu_mvtype.atck][i][enu_mv_att.strength] = rea_damage;
					arr_team_m[arr_mvatt[enu_mv_att.target], enu_team.cur_health] += -rea_damage;
					arr_team_m[rea_player, enu_team.cur_money] += rea_damage;
					
					if arr_team_m[arr_mvatt[enu_mv_att.target], enu_team.cur_health] <= 0 {
						arr_team_m[arr_mvatt[enu_mv_att.target], enu_team.alive] = false;
						//i: ADD RANGE
						scr_tool_give_item(enu_shop_item.range, rea_player)
						bol_newdeath = true;
						if arr_team_m[arr_mvatt[enu_mv_att.target], enu_team.intel1] = enu_intel.human{
							arr_wrkflw[enu_wrkflw.loser] = arr_mvatt[enu_mv_att.target];
							arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_minor;
							arr_wrkflw[enu_wrkflw.st2] = enu_st2.minor_youlose;
						}
					}
				//healing attack
				}else{
					var rea_damage = max(arr_team_m[rea_player, enu_team.damage], 1);
					arr_team_m[arr_mvatt[enu_mv_att.target], enu_team.cur_health] += max(floor(rea_damage/2),1);
				}
				arr_moves[rea_player][enu_mvtype.atck][i][enu_mv_att.exestatus] = enu_exestatus.complete;
			}
		}

	
		var rea_alive_cnt = 0;
		var rea_winner = noone;
		for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
			if arr_team_m[i, enu_team.alive]{
				 rea_alive_cnt += 1;
				 rea_winner = i;
			}
		}
		if rea_alive_cnt = 1 and bol_newdeath{
			if arr_team_m[rea_winner, enu_team.intel1] = enu_intel.human{
				arr_wrkflw[enu_wrkflw.winner] = rea_winner;
				arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_minor;
				arr_wrkflw[enu_wrkflw.st2] = enu_st2.minor_youwin;
			}
		}
		scr_eng_team_stats_calc(rea_player, false);
		
	}
	
	if rea_move_type = enu_mvtype.shop{
		
		var arr_shop_t = arr_team_m[rea_player][enu_team.shop];
		for (var i = 0; i < scr_tool_a_len(arr_moves[rea_player][enu_mvtype.shop]); i += 1){
			var arr_mvshp = arr_moves[rea_player][enu_mvtype.shop][i];
			if arr_mvshp[enu_mv_shp.exestatus] = enu_exestatus.notcomplete{	
				var rea_shop_loc = arr_mvshp[enu_mv_shp.loc];
				var rea_item_id = arr_shop_t[rea_shop_loc];
				if enu_shop_item.empty <> rea_item_id{
					if arr_shop_t[rea_shop_loc] = enu_shop_item.refresh{
							scr_eng_mv_setbuy_refreshshop(rea_player);
					}else{
						arr_shop_t[ rea_shop_loc] = enu_shop_item.empty;
						arr_team_m[rea_player, enu_team.shop] = arr_shop_t;
						scr_tool_give_item(rea_item_id, rea_player);
					}
					arr_team_m[rea_player, enu_team.cur_money] = arr_team_m[rea_player, enu_team.cur_money] - arr_shop_items[rea_item_id, enu_shop_prop.cost];
				}
				arr_moves[rea_player][enu_mvtype.shop][i][enu_mv_shp.exestatus] = enu_exestatus.complete;
				scr_eng_team_stats_calc(rea_player, false);
			}
		}
	}
	scr_buttons_make_all();
}