// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eng_mv_setbuy_refreshshop(){
	var rea_player = argument[0]
	
	var arr_items = noone;
	arr_items[0] = enu_shop_item.refresh;
	arr_items[1] = enu_shop_item.defence;
	arr_items[2] = enu_shop_item.income;
	arr_items[3] = enu_shop_item.regen;
	arr_items[4] = enu_shop_item.attack;
	arr_items[6] = enu_shop_item.mexhealth;
	arr_items[5] = enu_shop_item.range;
	arr_team_m[rea_player,enu_team.shop] = arr_items;
}