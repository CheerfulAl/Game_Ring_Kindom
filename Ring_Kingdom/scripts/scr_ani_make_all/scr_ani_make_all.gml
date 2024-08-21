// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ani_make_all(){
	scr_buttons_make_all();
	arr_animation = noone;
	var arr_coo1 = noone;
	var arr_coo2 = noone;
	arr_coo1[0] = 0.5*arr_grphc[enu_grphc.guiw];
	arr_coo1[1] = 0.5*arr_grphc[enu_grphc.guih];
	var rea_line_id1 = scr_ani_make_single(enu_ani_type.test_countdown_simple, noone, arr_coo1);
	var arr_triger1 = noone;
	arr_triger1[0] = rea_line_id1;
	arr_coo1[1] = 0.55*arr_grphc[enu_grphc.guih];
	arr_coo2[0] = 0.9*arr_grphc[enu_grphc.guiw];
	arr_coo2[1] = 0.9*arr_grphc[enu_grphc.guih];
	var rea_line_id2 = scr_ani_make_single(enu_ani_type.move_simple, arr_triger1, arr_coo1, arr_coo2);
	arr_coo1[1] = 0.6*arr_grphc[enu_grphc.guih];
	var rea_line_id3 = scr_ani_make_single(enu_ani_type.delta_fade, arr_triger1, arr_coo1, noone, noone, noone, noone, "Value");
	var arr_triger2 = noone;
	arr_coo[1] = 0.65*arr_grphc[enu_grphc.guih];
	arr_triger2[0] =  rea_line_id2;
	arr_triger2[1] =  rea_line_id3;
	var rea_line_id4 = scr_ani_make_single(enu_ani_type.test_countdown_moving, arr_triger2, arr_coo1)
}