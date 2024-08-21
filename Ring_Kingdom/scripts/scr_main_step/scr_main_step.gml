// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_main_step(){

	scr_step_input();
	
	//Get button
	if arr_temp[enu_temp.runani]{
		scr_ani_run();
	}
	
	
	if arr_temp[enu_temp.runani]{
		arr_team_m = arr_team_a;
	}else{
		arr_team_m = arr_team_f;
	}
	
	arr_temp[enu_temp.curbt] = noone;
	for (var i = scr_tool_a_len(arr_button)-1; i >= 0 ; i += -1){
		var arr_button_t = arr_button[i];
		var rea_spr_t = arr_button_t[enu_button.sprte];
		var rea_spr_wid = sprite_get_width(rea_spr_t)*arr_grphc[enu_grphc.winex];
		var rea_spr_hei = sprite_get_height(rea_spr_t)*arr_grphc[enu_grphc.winex];
		var bol_in_wid = ((arr_button_t[enu_button.posx]-rea_spr_wid*arr_button_t[enu_button.scale]/2) < arr_inputs[enu_inputs.mguix]) and ((arr_button_t[enu_button.posx]+rea_spr_wid*arr_button_t[enu_button.scale]/2) > arr_inputs[enu_inputs.mguix]);
		var bol_in_hei = ((arr_button_t[enu_button.posy]-rea_spr_hei*arr_button_t[enu_button.scale]/2) < arr_inputs[enu_inputs.mguiy]) and ((arr_button_t[enu_button.posy]+rea_spr_hei*arr_button_t[enu_button.scale]/2) > arr_inputs[enu_inputs.mguiy]);
		if bol_in_wid and bol_in_hei{
			arr_temp[enu_temp.curbt] = i;
		}
	}
	if arr_temp[enu_temp.curbt] <> noone{
		var arr_button_t = arr_button[arr_temp[enu_temp.curbt]];
		if arr_inputs[enu_inputs.clckl]{
			var rea_but_fnc = arr_button_t[enu_button.fnctn];
			var var_but_inf1 = arr_button_t[enu_button.info1];
			var var_but_inf2 = arr_button_t[enu_button.info2];
			var var_but_inf3 = arr_button_t[enu_button.info3];
			var var_but_inf4 = arr_button_t[enu_button.info4];
			var rea_but_txt = arr_button_t[enu_button.text];
			scr_buttons_function(rea_but_fnc, var_but_inf1, var_but_inf2, var_but_inf3, var_but_inf4, rea_but_txt);
			scr_tool_1action();
		}	
	}
	
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.game{
		if arr_wrkflw[enu_wrkflw.autorun] = true{
			if arr_team_m[arr_wrkflw[enu_wrkflw.cpturn], enu_team.alive] and arr_team_m[arr_wrkflw[enu_wrkflw.cpturn], enu_team.intel1] <> enu_intel.human{
				scr_eng_ai_movepick();
				scr_eng_execute(enu_mvtype.shop, arr_wrkflw[enu_wrkflw.cpturn]);
				scr_eng_execute(enu_mvtype.atck, arr_wrkflw[enu_wrkflw.cpturn]);
			}
			scr_eng_newturn_end();
			scr_eng_newturn_start(arr_wrkflw[enu_wrkflw.cpturn]);			
			if arr_team_m[arr_wrkflw[enu_wrkflw.cpturn], enu_team.intel1] = enu_intel.human and arr_team_m[arr_wrkflw[enu_wrkflw.cpturn], enu_team.alive]{
				arr_wrkflw[enu_wrkflw.autorun] = false;
			}else{
				arr_wrkflw[enu_wrkflw.autorun] = true;
			}
		}
	}
}