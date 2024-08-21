// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_mv_setattack(){
	var rea_target = argument[0];
	var arr_mvatt = noone;
	var rea_cup = arr_wrkflw[enu_wrkflw.cpturn];
	
	arr_mvatt[enu_mv_att.target] = rea_target;
	arr_mvatt[enu_mv_att.strength] = noone; // set with defence factored in
	arr_mvatt[enu_mv_att.exestatus] = enu_exestatus.notcomplete;
	arr_moves[rea_cup][enu_mvtype.atck][placeholder_zero]  = arr_mvatt;
}