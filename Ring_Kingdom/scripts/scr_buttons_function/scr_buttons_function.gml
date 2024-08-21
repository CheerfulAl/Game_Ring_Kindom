// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buttons_function(){
		
	var rea_but_fnc = argument[0];
	var var_but_inf1 = argument[1];
	var var_but_inf2 = argument[2];
	var var_but_inf3 = argument[3];
	var var_but_inf4 = argument[4];
	var rea_but_txt = argument[5];
	if rea_but_fnc = enu_function.placeholder{
		show_message("placeholder function")
	}
	var rea_cup = noone;
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.game{
		rea_cup = arr_wrkflw[enu_wrkflw.cpturn];
	}
	
	if rea_but_fnc = enu_function.statusassign{
		arr_wrkflw[enu_wrkflw.st1] = var_but_inf1;
		arr_wrkflw[enu_wrkflw.st2] = var_but_inf2;
		
		if var_but_inf3 = enu_function2.clearwinose{
			arr_wrkflw[enu_wrkflw.winner] = noone;
			arr_wrkflw[enu_wrkflw.loser] = noone;
		}
	}
	
	if rea_but_fnc = enu_function.gamexit{
		game_end()
	}
	if rea_but_fnc = enu_function.newsingle{
		scr_newgame_initial();
		arr_wrkflw[enu_wrkflw.st1] = enu_st1.game;
		arr_wrkflw[enu_wrkflw.st2] = enu_st2.gp_standard;
	}
	if rea_but_fnc = enu_function.destroygame{
		arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_main;
		arr_wrkflw[enu_wrkflw.st2] = enu_st2.main_initial;
		scr_newgame_destroygame();
		
	}
	if rea_but_fnc = enu_function.turnready{
		scr_eng_execute(enu_mvtype.atck, arr_wrkflw[enu_wrkflw.cpturn]);
		scr_eng_newturn_end();
		
		
		arr_wrkflw[enu_wrkflw.autorun] = true;
	}
	
	if rea_but_fnc = enu_function.resetattacks{
		scr_eng_mv_new(rea_cup);
	}
	
	if rea_but_fnc = enu_function.setattacks{
		var bol_check = scr_eng_options_legal_check(var_but_inf1, enu_mvtype.atck);
		
		if bol_check{
			scr_eng_mv_setattack(var_but_inf1);
		}
	}
	if rea_but_fnc = enu_function.buyitem{
		var bol_check = scr_eng_options_legal_check(var_but_inf1, enu_mvtype.shop);
		if bol_check{
			scr_eng_mv_setbuy(var_but_inf1);
			scr_eng_execute(enu_mvtype.shop, arr_wrkflw[enu_wrkflw.cpturn]);
			scr_tool_get_center_coo(false);
			scr_camera_scroll(arr_grphc[enu_grphc.guicenx], arr_grphc[enu_grphc.guiceny]);
			var rea_ideal_zoom = scr_tool_get_ideal_zoom();
			scr_camera_zoom(noone, rea_ideal_zoom);
		}
	}
	if rea_but_fnc = enu_function.settings121{
		arr_settings[var_but_inf2] = var_but_inf1;
	}
	if rea_but_fnc = enu_function.resetcamera{
		scr_tool_get_center_coo(false);
		scr_camera_scroll(arr_grphc[enu_grphc.guicenx], arr_grphc[enu_grphc.guiceny]);
		var rea_ideal_zoom = scr_tool_get_ideal_zoom();
		show_message("reset camera ideal zoom: "+string(rea_ideal_zoom)+" - "+string(arr_grphc[enu_grphc.winusew]))
		scr_camera_zoom(noone, rea_ideal_zoom);
	}
	if rea_but_fnc = enu_function.anirun{
		
		if arr_temp[enu_temp.runani]{
			//stop animation
			arr_temp[enu_temp.runani] = false;
		}else{
			arr_temp[enu_temp.runani] = true;
			scr_ani_make_all();
		}
		
	}
	scr_buttons_make_all();	
}