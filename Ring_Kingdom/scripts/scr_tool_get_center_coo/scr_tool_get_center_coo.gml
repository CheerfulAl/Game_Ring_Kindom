// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tool_get_center_coo(){
	
	var bol_z = argument[0];
	
	var rea_hup = 0;

	if bol_z {
		//arr_grphc[enu_grphc.guicenx_z] = 0.5*arr_grphc[enu_grphc.guiw];
		//arr_grphc[enu_grphc.guiceny_z] = 0.5*arr_grphc[enu_grphc.guih];
		
		arr_grphc[enu_grphc.guicenx_z] = 1000;
		arr_grphc[enu_grphc.guiceny_z] = 1000;
	}else{
		if arr_team_m = noone{
			arr_grphc[enu_grphc.guicenx] = arr_grphc[enu_grphc.guicenx_z];
			arr_grphc[enu_grphc.guiceny] = arr_grphc[enu_grphc.guiceny_z];
		}else{
			arr_in_range = noone;
			for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
				if scr_tool_get_range(i, rea_hup) <= arr_team_m[rea_hup, enu_team.vision] {
					arr_in_range[scr_tool_a_len(arr_in_range)] = i;
				}
			}
	
			var rea_x2 = -100000;
			var rea_x1 = 100000;
			var rea_y2 = -100000;
			var rea_y1 = 100000;
	
			for (var i = 0; i < scr_tool_a_len(arr_in_range); i += 1){
				var arr_coo = arr_team_m[arr_in_range[i], enu_team.cord];
				rea_x1 = min(rea_x1,arr_coo[0]);
				rea_x2 = max(rea_x2,arr_coo[0]);
				rea_y1 = min(rea_y1,arr_coo[1]);
				rea_y2 = max(rea_y2,arr_coo[1]);
				//show_message("set center1: "+string(arr_coo)+" - "+string((rea_y1+rea_y2)/2)+ " ---- "+string(.5*arr_grphc[enu_grphc.guiw])+" - "+string(.5*arr_grphc[enu_grphc.guih]));
			}
	
			//arr_grphc[enu_grphc.guicenx] = 0.5*arr_grphc[enu_grphc.guiw];
			//arr_grphc[enu_grphc.guiceny] = 0.5*arr_grphc[enu_grphc.guih];
			
			arr_grphc[enu_grphc.guicenx] = (rea_x1+rea_x2)/2;
			arr_grphc[enu_grphc.guiceny] = (rea_y1+rea_y2)/2;
			//arr_grphc[enu_grphc.guicenx] = 0.5*arr_grphc[enu_grphc.guiw]-abs(0.5*arr_grphc[enu_grphc.guiw]-(rea_x1+rea_x2)/2);
			//arr_grphc[enu_grphc.guiceny] = 0.5*arr_grphc[enu_grphc.guih]-abs(0.5*arr_grphc[enu_grphc.guih]-(rea_y1+rea_y2)/2);
			
			//show_message("set center2: "+string(arr_grphc[enu_grphc.guiceny])+ " ---- "+string(.5*arr_grphc[enu_grphc.guiw])+" - "+string(.5*arr_grphc[enu_grphc.guih]));
		}
	}
}