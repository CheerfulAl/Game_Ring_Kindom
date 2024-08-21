// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_camera_make() {
	// DES: Create a camera in initialising or in other camera functions
	
	/*I:
	https://forum.yoyogames.com/index.php?threads/guide-meet-the-new-camera-system.12269/
	https://www.youtube.com/watch?v=aZsD9tAI_18&feature=youtu.be
	https://www.youtube.com/watch?v=UNZ97-c3dhY
	https://www.reddit.com/r/gamemaker/comments/372ble/tutorial_in_game_resolution_control/
	*/



	var rea_cam_zoom_temp =  arr_grphc[enu_grphc.cam_zoom];
	var rea_width = arr_grphc[enu_grphc.winusew];
	var rea_height = rea_width*arr_grphc[enu_grphc.winusear];
	var rea_width_camera = arr_grphc[enu_grphc.winusew] *rea_cam_zoom_temp;
	var rea_height_camera = arr_grphc[enu_grphc.winusear]*rea_width_camera;
	//I2: WIDOW SIZE
	display_reset(0, true);
	// ADJUST THIS TO TURN OFF FULL SCREEN turn off fullscreeen here
	window_set_size(rea_width , rea_height);
	display_set_gui_size(rea_width ,rea_height);
	surface_resize(application_surface, rea_width , rea_height);

	//I2: SET THE VIEWS
	//I: Enable the use of views
	view_enabled = true;

	//I: Make view 0 visible
	view_set_visible(0, true);

	//I: Set the port bounds of view 0 to 640x480
	view_set_wport(0, rea_width);
	view_set_hport(0, rea_height);

	//I: Camera creation
	//I: Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
	arr_grphc[enu_grphc.camera] = camera_create_view(arr_grphc[enu_grphc.cam_centx]-rea_width_camera/2, arr_grphc[enu_grphc.cam_centy]-rea_height_camera/2,rea_width_camera, rea_height_camera, 0, -1, -1, -1, 32, 32);
	//arr_grphc[enu_grphc.camera] = camera_create_view(arr_grphc[enu_grphc.cam_centx], arr_grphc[enu_grphc.cam_centy],rea_width_camera, rea_height_camera, 0, -1, -1, -1, 32, 32);
	//I: Set view0 to use the camera "camera
	view_set_camera(0, arr_grphc[enu_grphc.camera]);
}