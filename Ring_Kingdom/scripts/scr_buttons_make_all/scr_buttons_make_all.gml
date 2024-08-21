// Script assets have changed for v2.3.0 see
function scr_buttons_make_all(){
	arr_button = noone;
	//MAIN MENU
	var rea_mainm_x1 = 0.20*arr_grphc[enu_grphc.guiw];
	var rea_mainm_y1 = 0.25*arr_grphc[enu_grphc.guih];
	var rea_mainm_y2 = 0.40*arr_grphc[enu_grphc.guih];
	var rea_mainm_y3 = 0.55*arr_grphc[enu_grphc.guih];
	var rea_mainm_y4 = 0.70*arr_grphc[enu_grphc.guih];
	
	var rea_minornm_x1 = 0.5*arr_grphc[enu_grphc.guiw];
	var rea_minornm_y1 = 0.2*arr_grphc[enu_grphc.guih];
	var rea_minornm_y2 = 0.4*arr_grphc[enu_grphc.guih];
	var rea_minornm_y3 = 0.6*arr_grphc[enu_grphc.guih];
	var rea_minornm_y4 = 0.8*arr_grphc[enu_grphc.guih];
	
	
	
	var rea_cup = noone;
	var rea_hup = 0;
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_main{
		//scr_buttons_make_single(enu_function.placeholder, spr_but_menu, 0, 2*arr_grphc[enu_grphc.guiw], 0.1*arr_grphc[enu_grphc.guih], "Test");
	}
	if arr_dev[enu_dev.moreoptions] {
		scr_buttons_make_single(enu_function.resetcamera, spr_but_menu, 0, rea_mainm_x1, 0.9*arr_grphc[enu_grphc.guih], "Reset Camera", noone, 2, enu_st1.menu_main, enu_st2.main_setupsingle);
	}
	if arr_wrkflw[enu_wrkflw.st2] = enu_st2.main_initial{
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y1, "Single Player", noone, 2, enu_st1.menu_main, enu_st2.main_setupsingle);
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y2, "Multi Player", noone, 2, enu_st1.menu_main, enu_st2.main_setupmulti);
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y3, "Load", noone, 2, enu_st1.menu_main, enu_st2.main_load);
		scr_buttons_make_single(enu_function.gamexit, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y4, "Exit",noone, 2,);
	}else if arr_wrkflw[enu_wrkflw.st2] = enu_st2.main_setupsingle{
		scr_buttons_make_single(enu_function.newsingle, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y1, "Start", noone, 2);
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y4, "Back", noone, 2, enu_st1.menu_main, enu_st2.main_initial);
	}else if arr_wrkflw[enu_wrkflw.st2] = enu_st2.main_setupmulti{
		scr_buttons_make_single(enu_function.placeholder, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y1, "TBC", noone, 2);
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y4, "Back", noone, 2, enu_st1.menu_main, enu_st2.main_initial);
	}else if arr_wrkflw[enu_wrkflw.st2] = enu_st2.main_load{
		scr_buttons_make_single(enu_function.placeholder, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y1, "Load 1", noone, 2, enu_st1.menu_main, enu_st2.main_setupsingle);
		scr_buttons_make_single(enu_function.placeholder, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y2,  "Load 2", noone, 2, enu_st1.menu_main, enu_st2.main_setupsingle);
		scr_buttons_make_single(enu_function.placeholder, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y3,  "Load 3", noone, 2, enu_st1.menu_main, enu_st2.main_load);
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_mainm_x1, rea_mainm_y4, "Back", noone, 2, enu_st1.menu_main, enu_st2.main_initial);
	}
	//MINOR MENU
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_minor{
		scr_buttons_make_single(enu_function.destroygame, spr_but_menu, 0, rea_minornm_x1, rea_minornm_y1, "Main Menu", noone, 2);
		scr_buttons_make_single(enu_function.statusassign, spr_but_menu, 0, rea_minornm_x1, rea_minornm_y2, "Continue", noone, 2, enu_st1.game, enu_st2.gp_standard, enu_function2.clearwinose);
	}
	//GAME
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.game{
		rea_cup = arr_wrkflw[enu_wrkflw.cpturn];
		scr_buttons_make_single(enu_function.statusassign, spr_icon_mainmenu, 0, 0.04*arr_grphc[enu_grphc.guiw], 0.075*arr_grphc[enu_grphc.guih], "", noone, 4, enu_st1.menu_minor, enu_st2.minor_pause);
		if arr_wrkflw[enu_wrkflw.st2] = enu_st2.gp_standard{
			scr_buttons_make_single(enu_function.settings121, spr_but_toggle, arr_settings[enu_settings.seeteamstats], 0.04*arr_grphc[enu_grphc.guiw], 0.15*arr_grphc[enu_grphc.guih], "See stats", noone, 4, not(arr_settings[enu_settings.seeteamstats]), enu_settings.seeteamstats);
			scr_buttons_make_single(enu_function.statusassign, spr_icon_shop, 0, (0.5-0.075)*arr_grphc[enu_grphc.guiw], 0.85*arr_grphc[enu_grphc.guih], "", noone, 4, enu_st1.game, enu_st2.gp_shop);
			scr_buttons_make_single(enu_function.resetattacks, spr_icon_refresh, 0, 0.5*arr_grphc[enu_grphc.guiw], 0.85*arr_grphc[enu_grphc.guih], "", noone, 4);
			scr_buttons_make_single(enu_function.turnready, spr_icon_continue, 0, (0.5+0.075)*arr_grphc[enu_grphc.guiw], 0.85*arr_grphc[enu_grphc.guih], "", noone, 4);
			
		}else{
			scr_buttons_make_single(enu_function.statusassign, spr_icon_exit, 0, 0.5*arr_grphc[enu_grphc.guiw], 0.85*arr_grphc[enu_grphc.guih], "", noone, 4, enu_st1.game, enu_st2.gp_standard);
		}
		//items player has
		var rea_statgap2 = 0.035;
		var rea_statstrt1 = 0.25;
		scr_buttons_make_single(enu_function.none, spr_token_health, 0, (rea_statstrt1-rea_statgap2*2)*arr_grphc[enu_grphc.guiw], 0.95*arr_grphc[enu_grphc.guih], string(arr_team_m[rea_hup,enu_team.cur_health])+"/"+string(arr_team_m[rea_hup,enu_team.max_health]), noone, 4, noone, noone, noone, noone);
		scr_buttons_make_single(enu_function.none, spr_token_money, 0, (rea_statstrt1-rea_statgap2*1)*arr_grphc[enu_grphc.guiw], 0.95*arr_grphc[enu_grphc.guih], string(arr_team_m[rea_hup,enu_team.cur_money])+" +"+string(arr_team_m[rea_hup,enu_team.inc_money]), noone, 4, noone, noone, noone, noone);
		for (var j = enu_team.damage; j < enu_team.range+1; j += 1){
			var k = j - enu_team.damage;
			scr_buttons_make_single(enu_function.none, 	arr_tstats_info[j, enu_teamstat_prop.sprite], 0, (rea_statstrt1+rea_statgap2*k)*arr_grphc[enu_grphc.guiw], 0.95*arr_grphc[enu_grphc.guih], string(arr_team_m[rea_hup, j]), noone, 4, j, noone);
		}
		var arr_items = arr_team_m[rea_hup, enu_team.item];
		for (var i = 0; i < scr_tool_a_len(arr_items); i += 1){
			var rea_item_id = arr_items[i, enu_team_item.itemid];
			scr_buttons_make_single(enu_function.none, arr_shop_items[rea_item_id, enu_shop_prop.sprite], 0, (0.75+rea_statgap2*i)*arr_grphc[enu_grphc.guiw], 0.95*arr_grphc[enu_grphc.guih], string(arr_items[i, enu_team_item.count]), noone, 4, i, noone);
		}
		
	}
	
	if arr_wrkflw[enu_wrkflw.st2] = enu_st2.gp_standard{
		var arr_mvatt = noone;
		scr_buttons_make_single(enu_function.anirun, spr_icon_animation, 0, 0.95*arr_grphc[enu_grphc.guiw], 0.95*arr_grphc[enu_grphc.guih], noone, noone, 4, j, noone);
		for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
			var rea_range = scr_tool_get_range(i, rea_hup);
			if rea_range <= arr_team_m[rea_hup,enu_team.vision]{
				var arr_coo = arr_team_m[i,enu_team.cord];
				var arr_coo = scr_tool_game2gui(arr_team_m[i,enu_team.cord], true);
				//scr_buttons_make_single(enu_function.placeholder, spr_token_base, 0, rea_mainm_x1, rea_mainm_y1);
				scr_buttons_make_single(enu_function.setattacks, spr_token_base_color, 0, arr_coo[0], arr_coo[1], noone, noone, 6/arr_grphc[enu_grphc.cam_zoom], i, noone, noone, noone, enu_specail.kingdom);
			
				var rea_statgap = 0.025;
				var rea_target = noone;
				//scr_buttons_make_single(enu_function.none, spr_sticon_range, 0, arr_coo[0] + 0.16*arr_grphc[enu_grphc.guiw], arr_coo[1], string(arr_team_m[i,enu_team.range]), noone, 4, i, noone, noone, noone);
				if arr_moves[rea_hup][enu_mvtype.atck] <> noone{
					var arr_mvatt = arr_moves[rea_hup][enu_mvtype.atck][placeholder_zero];
					rea_target = arr_mvatt[enu_mv_att.target];
					if arr_mvatt[enu_mv_att.target] = i{
						scr_buttons_make_single(enu_function.none, spr_token_target, 0, arr_coo[0], arr_coo[1], "", noone, 4, i, noone, noone, noone);
					}
				}
		
				if arr_team_m[i, enu_team.alive] {
					spr_life = spr_token_health;
					scr_buttons_make_single(enu_function.none, spr_life, 0, arr_coo[0] + rea_statgap*1.5*arr_grphc[enu_grphc.guiw], arr_coo[1], string(arr_team_m[i,enu_team.cur_health])+"/"+string(arr_team_m[i,enu_team.max_health]), noone, 2, i, noone, noone, noone);
					if arr_settings[enu_settings.seeteamstats] or i = rea_target{
						var spr_intel = spr_token_human;
						if arr_team_m[i, enu_team.intel1] <> enu_intel.human{
							spr_intel = spr_token_ai;
						}
						var spr_life = spr_token_health;
						
						scr_buttons_make_single(enu_function.none, spr_token_money, 0, arr_coo[0] + rea_statgap*2.5*arr_grphc[enu_grphc.guiw], arr_coo[1], string(arr_team_m[i,enu_team.cur_money])+" +"+string(arr_team_m[i,enu_team.inc_money]), noone, 2, i, noone, noone, noone);
						scr_buttons_make_single(enu_function.none, spr_intel, 0, arr_coo[0], arr_coo[1]- 0.04*arr_grphc[enu_grphc.guiw], "", noone, 2, i, noone, noone, noone);
						for (var j = enu_team.damage; j < enu_team.range+1; j += 1){
							var k = j - enu_team.damage;
							scr_buttons_make_single(enu_function.none, 	arr_tstats_info[j, enu_teamstat_prop.sprite], 0, arr_coo[0]+ (rea_statgap*3.5)*arr_grphc[enu_grphc.guiw]+ rea_statgap*arr_grphc[enu_grphc.guiw]*k, arr_coo[1], string(arr_team_m[i, j]), noone, 2, j, noone);
						}
						var arr_items =arr_team_m[i, enu_team.item];
						for (var j = 0; j < scr_tool_a_len(arr_items); j += 1){
							var rea_item_id = arr_items[j, enu_team_item.itemid];
							scr_buttons_make_single(enu_function.none, arr_shop_items[rea_item_id, enu_shop_prop.sprite], 0, arr_coo[0]+ 0.04*arr_grphc[enu_grphc.guih]*j, arr_coo[1] + 0.04*arr_grphc[enu_grphc.guiw], string(arr_items[j, enu_team_item.count]), noone, 2, j, noone);
						}
					}
				}
			}
		}
	}
	
	if arr_wrkflw[enu_wrkflw.st2] = enu_st2.gp_shop{
		
		scr_buttons_make_single(enu_function.buyitem, spr_token_money, 0, 0.1*arr_grphc[enu_grphc.guiw], 0.15*arr_grphc[enu_grphc.guih] , arr_team_m[rea_hup,enu_team.cur_money], noone, 4, i, noone);
		var arr_shop_t =arr_team_m[rea_hup, enu_team.shop];
		for (var i = 0; i < scr_tool_a_len(arr_shop_t); i += 1){
			var rea_item_id = arr_shop_t[i];
			scr_buttons_make_single(enu_function.buyitem, arr_shop_items[rea_item_id, enu_shop_prop.sprite], 0, 0.2*arr_grphc[enu_grphc.guiw], (0.15+0.1*i) *arr_grphc[enu_grphc.guih] , "", noone, 4, i, noone);
			if rea_item_id <> enu_shop_item.empty{
				scr_buttons_make_single(enu_function.buyitem, spr_token_money, 0, 0.23*arr_grphc[enu_grphc.guiw], (0.15+0.1*i) *arr_grphc[enu_grphc.guih] , arr_shop_items[rea_item_id, enu_shop_prop.cost], noone, 4, noone, noone);
			}
		}
	}
}