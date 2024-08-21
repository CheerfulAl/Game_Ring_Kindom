// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_options_legal_check(){
	var rea_move = argument[0];
	var rea_mve_type = argument[1];
	var bol_legal = false;

	var arr_options = scr_eng_options(rea_mve_type);
	for (var i = 0; i < scr_tool_a_len(arr_options); i += 1){
		if arr_options[i] = rea_move{
			bol_legal = true;
		}
	}

	return bol_legal;
}