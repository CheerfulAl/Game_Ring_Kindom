// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_ai_movepick(){
	var arr_options = scr_eng_options(enu_mvtype.atck);
	var rea_target = noone;
	if arr_options <> noone{
		var rea_rnd = floor(random(scr_tool_a_len(arr_options)));
		rea_target = arr_options[rea_rnd];
	}
	if rea_target <> noone{
		scr_eng_mv_setattack(rea_target);
	}
	
	for (var i = 0; i < 10; i += 1){// set two buys
		rea_target = noone;
		var arr_options = scr_eng_options(enu_mvtype.shop);
		if arr_options <> noone{
			var rea_rnd = floor(random(scr_tool_a_len(arr_options)));
			rea_target = arr_options[rea_rnd];
		}
		if rea_target <> noone{
			scr_eng_mv_setbuy(rea_target);
		}
	}

}