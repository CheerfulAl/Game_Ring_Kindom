// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tool_game2gui() {
	var arr_coo = argument[0];
	var bol_game_to_gui = argument[1];
	
	var rea_m = instance_nearest(x,y,obj_main);

	var rea_x = arr_coo[0];
	var rea_y = arr_coo[1];

	var rea_guiw = rea_m.arr_grphc[enu_grphc.guiw];
	var rea_guih = rea_m.arr_grphc[enu_grphc.guih];
	var rea_cam_centx = rea_m. arr_grphc[enu_grphc.cam_centx];
	var rea_cam_centy = rea_m.arr_grphc[enu_grphc.cam_centy];
	var rea_cam_zoom = rea_m.arr_grphc[enu_grphc.cam_zoom];


	var arr_coo2 = noone
	arr_coo2[0] = ((1/rea_cam_zoom)*(rea_x-rea_cam_centx)+rea_guiw/2);
	arr_coo2[1] = ((1/rea_cam_zoom)*(rea_y-rea_cam_centy)+rea_guih/2); //*rea_m.rea_window_expand
	

	return arr_coo2;
}