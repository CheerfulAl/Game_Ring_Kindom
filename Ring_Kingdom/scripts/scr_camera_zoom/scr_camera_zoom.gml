// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_camera_zoom() {
	//DES Zoom in Camera by a given ratio.
	
	var bol_zoom_in = argument[0]; // zome in ratio
	var rea_zoom_set = argument[1]; // zome in ratio
	
	var rea_cam_zoom_min = 1/4;
		var rea_cam_zoom_max = 4;
	
	if bol_zoom_in <> noone{
		
		if bol_zoom_in{
			arr_grphc[enu_grphc.cam_zoom] = max(arr_grphc[enu_grphc.cam_zoom]/2, rea_cam_zoom_min);
		}else{
			arr_grphc[enu_grphc.cam_zoom] = min(arr_grphc[enu_grphc.cam_zoom]*2, rea_cam_zoom_max);
		}
	}else{
		arr_grphc[enu_grphc.cam_zoom] =  min(max(rea_zoom_set, rea_cam_zoom_min), rea_cam_zoom_max);
		
	}
	scr_camera_make();
	scr_buttons_make_all();
}