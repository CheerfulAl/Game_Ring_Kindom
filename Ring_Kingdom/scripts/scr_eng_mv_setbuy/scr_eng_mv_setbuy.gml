// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_mv_setbuy(){
	
	var rea_shop_loc = argument[0]; //this is the position of the item. not the item id
	
	var rea_cup = arr_wrkflw[enu_wrkflw.cpturn];
	var rea_mv_num = scr_tool_a_len(arr_moves[rea_cup][enu_mvtype.shop]);
	
	var arr_mvbuy = noone;
	arr_mvbuy[enu_mv_shp.loc] = rea_shop_loc;
	arr_mvbuy[enu_mv_shp.exestatus] = enu_exestatus.notcomplete;
	arr_moves[rea_cup][enu_mvtype.shop][rea_mv_num] = arr_mvbuy;
}