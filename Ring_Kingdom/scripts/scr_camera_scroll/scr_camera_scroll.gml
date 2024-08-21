function scr_camera_scroll() {
	//DES: Moves the camera to given co-ordinates.
	
	var rea_scrolx = argument[0];
	var rea_scroly = argument[1];
	
	var rea_cam_minx = 0;
	var rea_cam_miny = 0;
	var rea_cam_maxx = 1000000;
	var rea_cam_maxy = 1000000;
	
	
	arr_grphc[enu_grphc.cam_centx] = min(max(rea_scrolx, rea_cam_minx), rea_cam_maxx);
	arr_grphc[enu_grphc.cam_centy] = min(max(rea_scroly, rea_cam_miny), rea_cam_maxy);
	scr_camera_make();
	scr_buttons_make_all()
}














