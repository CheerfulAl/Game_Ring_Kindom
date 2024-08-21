// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buttons_make_single(){
	var rea_len = scr_tool_a_len(arr_button);
	for (var i = 0; i < enu_button.last; i += 1){
		if argument_count > i{
			arr_button[rea_len, i] = argument[i];
		}else{
			if i = enu_button.font{
				arr_button[rea_len, i] = fnt_4;
			}else if i = enu_button.scale{
				arr_button[rea_len, i] = 1;
			}else if i = enu_button.color{
				arr_button[rea_len, i] = c_white;
			}else{
				arr_button[rea_len, i] = noone;
			}
		}
	}
}