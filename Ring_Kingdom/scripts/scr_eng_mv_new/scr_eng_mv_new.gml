// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_mv_new(){
	
	var rea_team = argument[0];	
	var rea_team_s = noone;
	var rea_team_e = noone;
	if rea_team = noone{
		arr_moves = noone;
		rea_team_s = 0;
		rea_team_e = scr_tool_a_len(arr_team_m);
	}else{
		rea_team_s = rea_team;
		rea_team_e = rea_team+1;
		//rea_team_s = 0;
		//rea_team_e = 0+1;
	}
	for (var i = rea_team_s; i < rea_team_e; i += 1){
		for (var j = 0; j < enu_mvtype.last; j += 1){
			arr_moves[i][j] = noone;
		}
	}

}