// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_tool_get_range(){
	var rea_p1 = argument[0];
	var rea_p2 = argument[1];
	var rea_return = noone;
	
	var rea_len = scr_tool_a_len(arr_team_m);
	
	var rea_dis1 = abs(rea_p1-rea_p2);
	var rea_dis2 = abs((rea_len-rea_p1)+rea_p2);
	var rea_dis3 = abs((rea_len-rea_p2)+rea_p1);
	
	rea_return = min(rea_dis1,rea_dis2,rea_dis3);
	
	return rea_return
}