// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ani_draw(){

	for (var i = 0; i < scr_tool_a_len(arr_ani_draw) ; i += 1){
		draw_sprite_ext(arr_ani_draw[i, enu_ani_draw.sprite], arr_ani_draw[i, enu_ani_draw.subimage], arr_ani_draw[i, enu_ani_draw.coox], arr_ani_draw[i, enu_ani_draw.cooy], arr_ani_draw[i, enu_ani_draw.scale], arr_ani_draw[i, enu_ani_draw.scale], 0, arr_ani_draw[i, enu_ani_draw.col], arr_ani_draw[i, enu_ani_draw.alpha]);
		draw_text(arr_ani_draw[i, enu_ani_draw.coox], arr_ani_draw[i, enu_ani_draw.cooy], arr_ani_draw[i, enu_ani_draw.ani_id])
	}
}
