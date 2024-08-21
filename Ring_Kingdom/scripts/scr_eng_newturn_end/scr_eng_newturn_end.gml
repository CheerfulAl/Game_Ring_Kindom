// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_newturn_end(){
	var rea_cup = arr_wrkflw[enu_wrkflw.cpturn];
	var rea_noplayers = scr_tool_a_len(arr_team_m);
	if arr_team_m[rea_cup, enu_team.alive] {
		scr_eng_mv_setbuy_refreshshop(rea_cup);
		arr_team_m[rea_cup][enu_team.cur_health] = min(arr_team_m[rea_cup][enu_team.cur_health] +arr_team_m[rea_cup][enu_team.regen],arr_team_m[rea_cup][enu_team.max_health]);
		arr_team_m[rea_cup][enu_team.cur_money] += arr_team_m[rea_cup][enu_team.inc_money];
	}
	scr_tool_get_center_coo(false);
	scr_camera_scroll(arr_grphc[enu_grphc.guicenx], arr_grphc[enu_grphc.guiceny]);
	var rea_ideal_zoom = scr_tool_get_ideal_zoom();
	scr_camera_zoom(noone, rea_ideal_zoom);
	arr_wrkflw[enu_wrkflw.cpturn] = (arr_wrkflw[enu_wrkflw.cpturn] + 1) mod rea_noplayers;
	if arr_wrkflw[enu_wrkflw.cpturn] = 0{arr_wrkflw[enu_wrkflw.cycle] +=1};
	arr_team_f = arr_team_m;
}