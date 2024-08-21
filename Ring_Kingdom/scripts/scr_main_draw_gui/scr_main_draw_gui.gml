// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_main_draw_gui(){
	
	//var arr_coo = noone
	//arr_coo[0] = 200;
	//arr_coo[1] = 200
	//var arr_coo2 = scr_tool_game2gui(arr_coo, true);
	//arr_coo2 = arr_coo;
	//draw_sprite(spr_test2, 0, arr_coo2[0], arr_coo2[1]);
	//draw_text(arr_coo2[0], arr_coo2[1], "1: "+string(arr_coo2));
	//draw_sprite(spr_test2, 0, arr_coo2[0], arr_coo2[1]);
	//draw_text(arr_coo[0], arr_coo[1], "2:    "+string(arr_coo2));
	//draw_sprite(spr_test4, 0, 0, 0);
	//draw_sprite(spr_test4, 0, arr_grphc[enu_grphc.guiw],0);
	//draw_sprite(spr_test4, 0, 0, arr_grphc[enu_grphc.guih]);
	//draw_sprite(spr_test4, 0, arr_grphc[enu_grphc.guiw], arr_grphc[enu_grphc.guih]);
	
	
	
	scr_tool_draw_reset();
	var rea_hup = 0;
	if arr_dev[enu_dev.main]{
		var str_dev_text = string(arr_moves);
		var arr_button_t = arr_button[0];
		var rea_spr_t = arr_button_t[enu_button.sprte];
		var rea_spr_wid = sprite_get_width(rea_spr_t)*arr_grphc[enu_grphc.winex];
		var rea_spr_hei = sprite_get_height(rea_spr_t)*arr_grphc[enu_grphc.winex];
		var bol_in_wid = ((arr_button_t[enu_button.posx]-rea_spr_wid*arr_button_t[enu_button.scale]/2) < arr_inputs[enu_inputs.mousx]) and ((arr_button_t[enu_button.posx]+rea_spr_wid*arr_button_t[enu_button.scale]/2) > arr_inputs[enu_inputs.mousx]);
		var bol_in_hei = ((arr_button_t[enu_button.posy]-rea_spr_hei*arr_button_t[enu_button.scale]/2) < arr_inputs[enu_inputs.mousy]) and ((arr_button_t[enu_button.posy]+rea_spr_hei*arr_button_t[enu_button.scale]/2) > arr_inputs[enu_inputs.mousy]);
		var bol_in_wid1 = ((arr_button_t[enu_button.posx]-rea_spr_wid*arr_button_t[enu_button.scale]/2) < arr_inputs[enu_inputs.mousx]);
		var bol_in_wid2 = ((arr_button_t[enu_button.posx]+rea_spr_wid*arr_button_t[enu_button.scale]/2) > arr_inputs[enu_inputs.mousx]);
		var bol_in_hei1 = ((arr_button_t[enu_button.posy]-rea_spr_hei*arr_button_t[enu_button.scale]/2) < arr_inputs[enu_inputs.mousy]);
		var bol_in_hei2 = ((arr_button_t[enu_button.posy]+rea_spr_hei*arr_button_t[enu_button.scale]/2) > arr_inputs[enu_inputs.mousy]);
	
		
		str_dev_text = string(arr_inputs[enu_inputs.mguix]) +" - " + string(arr_inputs[enu_inputs.mguiy])+" - "+string(arr_temp[enu_temp.curbt])+" - "+string(arr_button[0])+" - "+string(bol_in_wid1)+" - "+string(bol_in_wid2)+" - "+string(bol_in_hei1)+" - "+string(bol_in_hei2);
		str_dev_text = string(arr_grphc[enu_grphc.guicenx_z]) +" - " + string(arr_grphc[enu_grphc.guiceny_z]) +" ---- "+string(arr_grphc[enu_grphc.guicenx])+" - "+string(arr_grphc[enu_grphc.guiceny]);
		str_dev_text = string(arr_grphc[enu_grphc.cam_zoom]) +" - " + string(scr_tool_get_ideal_zoom());
		draw_set_halign(fa_left);
		draw_text(0.05*arr_grphc[enu_grphc.guiw], 0.90*arr_grphc[enu_grphc.guih], "DEV: "+str_dev_text);
	}
	scr_tool_draw_reset();
	
	//MAIN MENU
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_main{
		draw_sprite_ext(spr_menu_background, 0, 0.5*arr_grphc[enu_grphc.guiw], 0.5*arr_grphc[enu_grphc.guih],1,1,1,c_white,1)
		draw_sprite_ext(spr_menu_background2, 0, 0.65*arr_grphc[enu_grphc.guiw], 0.5*arr_grphc[enu_grphc.guih],6,6,1,c_white,1)
		draw_sprite_ext(spr_menu_title, 0, 0.65*arr_grphc[enu_grphc.guiw], 0.5*arr_grphc[enu_grphc.guih],6,6,1,c_white,1)
	}
	
	
	
	
	//GAME
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.game{
		if arr_wrkflw[enu_wrkflw.st2] = enu_st2.gp_shop{
			draw_sprite_ext(spr_background_shop, 0,  0.5*arr_grphc[enu_grphc.guiw], 0.5*arr_grphc[enu_grphc.guih], 1, 1, 0, c_white, 1);
			draw_sprite_ext(spr_background_shop2, 0,  0.65*arr_grphc[enu_grphc.guiw], 0.5*arr_grphc[enu_grphc.guih], 6, 6, 0, c_white, 1);
		}
		var str_cp = arr_wrkflw[enu_wrkflw.cpturn];
		var str_cp_name = arr_team_m[str_cp, enu_team.name];
		var str_cp_color = arr_team_m[str_cp, enu_team.color];
		draw_set_color(str_cp_color);
		draw_rectangle(0.025*arr_grphc[enu_grphc.guiw], 0.925*arr_grphc[enu_grphc.guih], 0.125*arr_grphc[enu_grphc.guiw], .975*arr_grphc[enu_grphc.guih], false);
		draw_set_color(c_black);
		draw_rectangle(0.025*arr_grphc[enu_grphc.guiw], 0.925*arr_grphc[enu_grphc.guih], 0.125*arr_grphc[enu_grphc.guiw], .975*arr_grphc[enu_grphc.guih], true);
		draw_text(0.0725*arr_grphc[enu_grphc.guiw], 0.95*arr_grphc[enu_grphc.guih], str_cp_name);
	}
		
	//MINOR MENU
	if arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_minor{
		var str_message = noone;
		if arr_wrkflw[enu_wrkflw.st2] = enu_st2.minor_youlose{
			if  arr_wrkflw[enu_wrkflw.loser] <> noone {
				str_message = "You lose " + arr_team_m[arr_wrkflw[enu_wrkflw.loser], enu_team.name];
			}
		}
		if arr_wrkflw[enu_wrkflw.st2] = enu_st2.minor_youwin{
			if  arr_wrkflw[enu_wrkflw.winner] <> noone {
				str_message = "You win " + arr_team_m[arr_wrkflw[enu_wrkflw.winner], enu_team.name];
			}
		}
		if str_message <> noone{
			draw_text(0.5*arr_grphc[enu_grphc.guiw], 0.5*arr_grphc[enu_grphc.guih], str_message);
		}
	}
	//BUTTONS
	scr_tool_draw_reset();
	for (var i = 0; i < scr_tool_a_len(arr_button); i += 1){
		if arr_button[i, enu_button.spec] = noone{
			draw_sprite_ext(arr_button[i, enu_button.sprte], arr_button[i, enu_button.sindx], arr_button[i, enu_button.posx], arr_button[i, enu_button.posy], arr_button[i, enu_button.scale], arr_button[i, enu_button.scale], 0, arr_button[i, enu_button.color], 1);
			if arr_button[i, enu_button.text] <> noone{
				if arr_button[i, enu_button.sprte] = spr_but_toggle{
					draw_set_halign(fa_left);
					var rea_x = arr_button[i, enu_button.posx] + sprite_get_width(arr_button[i, enu_button.sprte])*arr_button[i, enu_button.scale]/2;
					draw_text(rea_x, arr_button[i, enu_button.posy], arr_button[i, enu_button.text]);
				}else{
					draw_set_halign(fa_center);
					draw_text(arr_button[i, enu_button.posx], arr_button[i, enu_button.posy], arr_button[i, enu_button.text]);
				}
				
			}
		}else if arr_button[i, enu_button.spec] = enu_specail.kingdom{
			var rea_tea = arr_button[i, enu_button.info1];
			var rea_col = arr_team_m[rea_tea, enu_team.color];
			draw_sprite_ext(spr_token_base_color, 0, arr_button[i, enu_button.posx], arr_button[i, enu_button.posy], arr_button[i, enu_button.scale], arr_button[i, enu_button.scale], 0, rea_col, 1);
			//draw_sprite_ext(arr_button[i, enu_button.sprte], arr_button[i, enu_button.sindx], arr_button[i, enu_button.posx], arr_button[i, enu_button.posy], arr_button[i, enu_button.scale], arr_button[i, enu_button.scale], 0, arr_button[i, enu_button.color], 1);
		}	
	}
	for (var i = 0; i < scr_tool_a_len(arr_button); i += 1){
		if arr_temp[enu_temp.curbt] = i{
			var arr_button_t = arr_button[i];
			var rea_spr_t = arr_button_t[enu_button.sprte];
			var rea_spr_wid = sprite_get_width(rea_spr_t)*arr_grphc[enu_grphc.winex];
			var rea_spr_hei = sprite_get_height(rea_spr_t)*arr_grphc[enu_grphc.winex];
			var rea_x1 = arr_button_t[enu_button.posx]-rea_spr_wid*arr_button_t[enu_button.scale]/2;
			var rea_x2 = arr_button_t[enu_button.posx]+rea_spr_wid*arr_button_t[enu_button.scale]/2;
			var rea_y1 = arr_button_t[enu_button.posy]-rea_spr_hei*arr_button_t[enu_button.scale]/2;
			var rea_y2 = arr_button_t[enu_button.posy]+rea_spr_hei*arr_button_t[enu_button.scale]/2;
			draw_set_color(c_white);
			draw_set_alpha(0.5);
			draw_rectangle(rea_x1, rea_y1, rea_x2, rea_y2, false);
		}
	}
	
	if arr_temp[enu_temp.runani]{
		scr_ani_draw();
	}
	
	scr_tool_draw_reset();
	
	scr_tool_draw_reset();
}