// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_newturn_start(){
	var rea_cp = arr_wrkflw[enu_wrkflw.cpturn];
	scr_eng_mv_new(rea_cp);
	for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){ //do this 
		arr_team_p = arr_team_m;
		arr_team_a = arr_team_m;
		if arr_team_m[i, enu_team.alive] = false{
			scr_eng_mv_new(i)
		}
	}
	scr_buttons_make_all();
}