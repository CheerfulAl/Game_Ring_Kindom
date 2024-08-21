// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tool_get_team_coo(){

	var rea_center_x = arr_grphc[enu_grphc.guicenx_z];
	var rea_center_y = arr_grphc[enu_grphc.guiceny_z];
	//var rea_radius = 0.4*arr_grphc[enu_grphc.guih];
	var rea_radius = 500;
	
	var rea_players = scr_tool_a_len(arr_team_m);
	for (var i = 0; i < rea_players; i += 1){
		var arr_coo = noone;
		arr_coo[0] = rea_center_x + sin(i/rea_players*(pi*2))*rea_radius;
		arr_coo[1] = rea_center_y + cos(i/rea_players*(pi*2))*rea_radius;
		arr_team_m[i, enu_team.cord] = arr_coo;
	}
	
	
}