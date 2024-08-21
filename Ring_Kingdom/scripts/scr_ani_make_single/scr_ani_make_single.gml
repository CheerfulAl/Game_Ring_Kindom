// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ani_make_single(){
	
	var rea_ani_type = argument[0];
	var arr_start_dependants = argument[1]; 
	
	var rea_len = scr_tool_a_len(arr_animation)
	
	arr_animation[rea_len, enu_animation.type] = rea_ani_type;
	arr_animation[rea_len, enu_animation.curtime] = 0;
	arr_animation[rea_len, enu_animation.complete] = false; 
	arr_animation[rea_len, enu_animation.running] = false;
	arr_animation[rea_len, enu_animation.start] = arr_start_dependants;
	arr_animation[rea_len, enu_animation.duration] = room_speed*2;
	
	for (var i = 0; i < (enu_animation.last -enu_animation.coo1); i += 1){
		if argument_count > 2+ i {
			arr_animation[rea_len, enu_animation.coo1 + i] = argument[i+2]; 
		}else{
			arr_animation[rea_len, enu_animation.coo1 + i] = noone;
		}
	}
	if arr_animation[rea_len, enu_animation.type] = enu_ani_type.move_simple{
		arr_animation[rea_len, enu_animation.duration] = room_speed*3;
	}
	
	return rea_len
}