// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_main_draw(){
	
	//draw_sprite(spr_test1,0,200,200);
	//draw_text(200,200,"200,200")
	//draw_sprite(spr_test3, 0, arr_grphc[enu_grphc.cam_centx],arr_grphc[enu_grphc.cam_centy]);
	//draw_sprite(spr_test5, 0, arr_grphc[enu_grphc.guicenx],arr_grphc[enu_grphc.guiceny]);
	//draw_sprite(spr_test6, 0, arr_grphc[enu_grphc.guicenx_z],arr_grphc[enu_grphc.guiceny_z]);
	//draw_sprite_ext(spr_test3, 0, arr_grphc[enu_grphc.cam_centx]-arr_grphc[enu_grphc.winusew]*arr_grphc[enu_grphc.cam_zoom]/(2), arr_grphc[enu_grphc.cam_centy]-arr_grphc[enu_grphc.winuseh]*arr_grphc[enu_grphc.cam_zoom]/2,arr_grphc[enu_grphc.cam_zoom],arr_grphc[enu_grphc.cam_zoom],1,c_white,1);
	//draw_sprite(spr_test3, 0, arr_grphc[enu_grphc.cam_centx]+arr_grphc[enu_grphc.winusew]/2, arr_grphc[enu_grphc.cam_centy]+arr_grphc[enu_grphc.winuseh]/2);
	
	var rea_hup = 0;
	
	if arr_wrkflw[enu_wrkflw.st2] = enu_st2.gp_standard{
		draw_sprite_ext(spr_grass, 0, arr_grphc[enu_grphc.guicenx_z],arr_grphc[enu_grphc.guiceny_z],4,4,1,c_white,1)
		for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
			var arr_coo1 = arr_team_m[i, enu_team.cord];
			var rea_color = arr_team_m[i, enu_team.color];
			var rea_range1 = scr_tool_get_range(rea_hup, i);
			var rea_see1 = (rea_range1 <= arr_team_m[rea_hup, enu_team.vision]);
			
			for (var j = 0; j < scr_tool_a_len(arr_team_m); j += 1){
				var rea_range2 = scr_tool_get_range(rea_hup, j);
				var rea_see2 = (rea_range2 <= arr_team_m[rea_hup, enu_team.vision]);
				var bol_in_range = arr_team_m[i, enu_team.range] >= scr_tool_get_range(i,j);
				var bol_alive = arr_team_m[i, enu_team.alive] and arr_team_m[j, enu_team.alive] ;
				if bol_in_range and bol_alive and (rea_see1 or rea_see2){
					var arr_coo2 = arr_team_m[j, enu_team.cord];
					var rea_angle_rad = arctan((arr_coo1[0] - arr_coo2[0])/(arr_coo1[1] - arr_coo2[1]));
					if arr_coo1[1] < arr_coo2[1]{
						rea_angle_rad = pi + arctan((arr_coo1[0] - arr_coo2[0])/(arr_coo1[1] - arr_coo2[1]));
					}
					var rea_angle = radtodeg(rea_angle_rad);
					var rea_len = sqrt(sqr(arr_coo1[0] - arr_coo2[0])+ sqr(arr_coo1[1] - arr_coo2[1]));
					draw_sprite_ext(spr_bg_road, 0, arr_coo2[0], arr_coo2[1], 4, rea_len, rea_angle, c_white, 0.2);
				}
			}
			
		}
		//castles after roads
		for (var i = 0; i < scr_tool_a_len(arr_team_m); i += 1){
			var arr_coo1 = arr_team_m[i, enu_team.cord];
			var rea_color = arr_team_m[i, enu_team.color];
			var rea_range1 = scr_tool_get_range(rea_hup, i);
			var rea_see1 = (rea_range1 <= arr_team_m[rea_hup, enu_team.vision]);
			if (rea_range1) or rea_hup =i{
				var int_cast = spr_castle;
				if not(arr_team_m[i, enu_team.alive]){
					var int_cast = spr_castle_ruins;
				}
				draw_sprite_ext(int_cast , 0, arr_coo1[0], arr_coo1[1], 4, 4, 0, c_white, 1);
				if arr_team_m[i, enu_team.alive]{
					draw_sprite_ext(spr_castle_team , 0, arr_coo1[0], arr_coo1[1], 4, 4, 0, rea_color, 1);
				}
			}
		}
			
		for (var i = 0; i < scr_tool_a_len(arr_moves); i += 1){
			var rea_attack = arr_moves[i][enu_mvtype.atck];
			var rea_col = arr_team_m[i, enu_team.color];
			var rea_range1 = scr_tool_get_range(rea_hup, i);
			var rea_see1 = (rea_range1 <= arr_team_m[rea_hup, enu_team.vision]);
			for (var j = 0; j < scr_tool_a_len(rea_attack); j += 1){
				var rea_range2 = scr_tool_get_range(rea_hup, rea_attack[j][enu_mv_att.target]);
				var rea_see2 = (rea_range2 <= arr_team_m[rea_hup, enu_team.vision]);
				var arr_coo1 = arr_team_m[i, enu_team.cord];
				var arr_coo2 = arr_team_m[rea_attack[j][enu_mv_att.target], enu_team.cord];
				if (rea_see1 or rea_see2){
					if (arr_coo1[0] <> arr_coo2[0]) or (arr_coo1[1]  <> arr_coo2[1]){
						var rea_angle_rad = arctan((arr_coo1[0] - arr_coo2[0])/(arr_coo1[1] - arr_coo2[1]));
						if arr_coo1[1] < arr_coo2[1]{
							rea_angle_rad = pi + arctan((arr_coo1[0] - arr_coo2[0])/(arr_coo1[1] - arr_coo2[1]));
						}
						var arr_coo_str = arr_coo1;
						var arr_coo_end = arr_coo2;
						var rea_len = sqrt(sqr(arr_coo1[0] - arr_coo2[0])+ sqr(arr_coo1[1] - arr_coo2[1]));
						var rea_perc_len = max((0.05*arr_grphc[enu_grphc.guiw])/rea_len,0)
						arr_coo_end[0] = arr_coo2[0] + (arr_coo1[0]-arr_coo2[0])*rea_perc_len;
						arr_coo_end[1] = arr_coo2[1] + (arr_coo1[1]-arr_coo2[1])*rea_perc_len;
						var rea_len2 = sqrt(sqr(arr_coo1[0] - arr_coo_end[0])+ sqr(arr_coo1[1] - arr_coo_end[1]));
						draw_set_color(rea_col);
						var rea_angle = radtodeg(rea_angle_rad);
						draw_sprite_ext(spr_arrow_body, 0, arr_coo_end[0], arr_coo_end[1], 4, rea_len2, rea_angle, rea_col, 1);
						draw_sprite_ext(spr_arrow_head, 0, arr_coo_end[0], arr_coo_end[1], 4, 4, rea_angle, rea_col, 1);
					}
				}
			}
		}	
	}
}