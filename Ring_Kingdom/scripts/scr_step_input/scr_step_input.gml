// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_step_input(){
	arr_inputs[enu_inputs.mousx] = mouse_x; 
	arr_inputs[enu_inputs.mousy] = mouse_y; 

	arr_inputs[enu_inputs.mguix] = device_mouse_x_to_gui(0);
	arr_inputs[enu_inputs.mguiy] = device_mouse_y_to_gui(0);
	
	arr_inputs[enu_inputs.mouwu] = mouse_wheel_up();
	arr_inputs[enu_inputs.mouwd] = mouse_wheel_down();

	if (mouse_check_button_pressed(mb_left) or arr_inputs[enu_inputs.clcfh]) and alarm[1] < 0 { // click + save last click
	    arr_inputs[enu_inputs.clckl] = true;
		arr_inputs[enu_inputs.clcfh] = false; // act ofholding acts as a click
		alarm[1] = 0.05*room_speed
	} else{
	    arr_inputs[enu_inputs.clckl] = false;
		arr_inputs[enu_inputs.clcfh] = false;
	}
	
	if arr_dev[enu_dev.freecamera]{
		if arr_inputs[enu_inputs.clckl] and arr_temp[enu_temp.curbt] = noone{
			scr_camera_scroll(arr_inputs[enu_inputs.mousx], arr_inputs[enu_inputs.mousy]);
		}
		if arr_inputs[enu_inputs.mouwu]{
			scr_camera_zoom(true, noone);
		}
		if arr_inputs[enu_inputs.mouwd]{
			scr_camera_zoom(false, noone);
		}
	}
}