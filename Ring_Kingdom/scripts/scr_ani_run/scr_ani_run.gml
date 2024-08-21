// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ani_run(){
	arr_ani_draw = noone;
	var rea_ani_d = 0;
	var bol_all_complete_total = true;
	for (var i = 0; i < scr_tool_a_len(arr_animation) ; i += 1){
		if arr_animation[i, enu_animation.running]{
			arr_animation[i, enu_animation.curtime] += 1;
			
			
			arr_ani_draw[rea_ani_d ,enu_ani_draw.ani_id] = i;
			arr_ani_draw[rea_ani_d ,enu_ani_draw.sprite] = spr_test_ani;
			arr_ani_draw[rea_ani_d ,enu_ani_draw.subimage] =  0;
			var arr_coo1 = arr_animation[i, enu_animation.coo1];
			arr_ani_draw[rea_ani_d ,enu_ani_draw.coox] = arr_coo1[0];
			arr_ani_draw[rea_ani_d ,enu_ani_draw.cooy] = arr_coo1[1];
			arr_ani_draw[rea_ani_d ,enu_ani_draw.scale] = 4;
			arr_ani_draw[rea_ani_d ,enu_ani_draw.col] = c_white;
			arr_ani_draw[rea_ani_d ,enu_ani_draw.alpha] = 1;
			
			var rea_per = arr_animation[i, enu_animation.curtime]/arr_animation[i, enu_animation.duration]
			
			//ALL SPECAIL CASES
			if arr_animation[i, enu_animation.type] = enu_ani_type.delta_fade {
				arr_ani_draw[rea_ani_d ,enu_ani_draw.sprite] = spr_ani_health;
				var arr_coo1 = arr_animation[i, enu_animation.coo1];
				arr_ani_draw[rea_ani_d ,enu_ani_draw.cooy] = arr_coo1[1] - 0.2*arr_grphc[enu_grphc.guih]*rea_per;
				var rea_fade_per = 0.2
				
				if rea_per < rea_fade_per{
					arr_ani_draw[rea_ani_d ,enu_ani_draw.alpha] = rea_per/rea_fade_per;
				}else if rea_per > (1-rea_fade_per){
					arr_ani_draw[rea_ani_d ,enu_ani_draw.alpha] = 1-(rea_per-(1-rea_fade_per))/rea_fade_per
				}else{
					arr_ani_draw[rea_ani_d ,enu_ani_draw.alpha] =  1
				}
			}
			if arr_animation[i, enu_animation.type] = enu_ani_type.move_simple{
				arr_ani_draw[rea_ani_d ,enu_ani_draw.sprite] = spr_ani_defend;
				var arr_coo1 = arr_animation[i, enu_animation.coo1];
				var arr_coo2 = arr_animation[i, enu_animation.coo2];
				var arr_coo3 = noone;
				arr_coo3[0] = arr_coo1[0] + (arr_coo2[0] - arr_coo1[0])*rea_per; 
				arr_coo3[1] = arr_coo1[1] + (arr_coo2[1] - arr_coo1[1])*rea_per;
				
				arr_ani_draw[rea_ani_d ,enu_ani_draw.coox] = arr_coo3[0]
				arr_ani_draw[rea_ani_d ,enu_ani_draw.cooy] = arr_coo3[1]
				
			}
			
			
			
			
			
			
			rea_ani_d = rea_ani_d + 1;
			if arr_animation[i, enu_animation.curtime] > arr_animation[i, enu_animation.duration]{
				arr_animation[i, enu_animation.running] = false;
				arr_animation[i, enu_animation.complete] = true;
			}
			
			
		}else{
			if not(arr_animation[i, enu_animation.complete]){
				var arr_dep = arr_animation[i, enu_animation.start];
				var bol_all_complete = true;
				for (var j = 0; j < scr_tool_a_len(arr_dep) ; j += 1){
					if not (arr_animation[arr_dep[j], enu_animation.complete]){
						bol_all_complete = false;
					}
				}
				if bol_all_complete{
					arr_animation[i, enu_animation.running] = true
				}
			}
		}
		if not(arr_animation[i, enu_animation.complete]){
			bol_all_complete_total = false;
		}
		
	}
	if bol_all_complete_total{
		arr_temp[enu_temp.runani] = false;
	}
	
}