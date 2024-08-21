// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tool_get_ideal_zoom(){

	var arr_in_range = noone;
	var rea_hup = 0;
	for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
		if scr_tool_get_range(i, rea_hup) <= arr_team_m[rea_hup, enu_team.vision] {
			arr_in_range[scr_tool_a_len(arr_in_range)] = i;
		}
	}
	var rea_best_zoom = 0.25;
	for (var j = 0; j < 6; j += 1){
		var rea_zoom = 1/power(2, j-2);
		var rea_border = 0.8;
		var rea_minx = arr_grphc[enu_grphc.cam_centx]-arr_grphc[enu_grphc.winusew]*rea_zoom*rea_border/2;
		var rea_maxx = arr_grphc[enu_grphc.cam_centx]+arr_grphc[enu_grphc.winusew]*rea_zoom*rea_border/2;
		var rea_miny = arr_grphc[enu_grphc.cam_centy]-arr_grphc[enu_grphc.winuseh]*rea_zoom*rea_border/2;
		var rea_maxy = arr_grphc[enu_grphc.cam_centy]+arr_grphc[enu_grphc.winuseh]*rea_zoom*rea_border/2;
		var bol_inx = true;
		var bol_iny = true;
		for (var i = 0; i < scr_tool_a_len(arr_in_range); i += 1){
			var arr_coo = arr_team_m[arr_in_range[i], enu_team.cord];
			if not((arr_coo[0] >= rea_minx) and (arr_coo[0] <= rea_maxx)){
				bol_inx = false;
			}
			if not((arr_coo[1] >= rea_miny) and (arr_coo[1] <= rea_maxy)){
				bol_inx = false;
			}
			//show_message("set center1: "+string(arr_coo)+" - "+string((rea_y1+rea_y2)/2)+ " ---- "+string(.5*arr_grphc[enu_grphc.guiw])+" - "+string(.5*arr_grphc[enu_grphc.guih]));
		}
		if bol_inx and bol_iny{
			rea_best_zoom = rea_zoom;
		}
	}
	
	return rea_best_zoom;
}