// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_startup_define(){
	
	//TEMP
	arr_temp = noone;
	enum enu_temp {
		curbt, //current button
		visongui_x1, //left of vison
		visongui_x2, //right of vison
		visongui_y1, //top of vison
		visongui_y2, //bottom of vison
		runani, // if animation is running
		last
	}
	
	for (var i = 0; i < enu_temp.last; i += 1){
		arr_temp[i] = noone;
	}
	arr_temp[enu_temp.runani] = false;
	
	arr_settings = noone;
	enum enu_settings {
		seeteamstats, 
		last
	}
	arr_settings[enu_settings.seeteamstats] = true;
	
	//INPUTS
	arr_inputs = noone;
	enum enu_inputs {
		mousx,
		mousy,
		mguix,
		mguiy,
		mouwu,
		mouwd,
		clckl,
		clcfh,
		last
	}
	for (var i = 0; i < enu_inputs.last; i += 1){
		arr_inputs[i] = noone
	}
	
	//BUTTONS
	arr_button = noone;
	enum enu_button {
		fnctn, //what this does
		sprte,
		sindx, //sprite index
		posx,
		posy,
		text,
		putxt, //popup text
		scale,
		info1,
		info2,
		info3,
		info4,
		spec, //specail format
		font,
		color,
		formt,//specail format (e.g. palyer button) 
		last
	}
	
	enum enu_specail {
		kingdom,
		last
	}
	
	//FUNCTION
	enum enu_function {
		placeholder,
		none,
		statusassign, // assign info 1 to status 1, info 2 to status 2
		gamexit,
		newsingle,
		destroygame,
		turnready,
		resetattacks,
		setattacks,
		buyitem,
		settings121,
		resetcamera,
		anirun,
		last
	}
	
	enum enu_function2 {
		clearwinose,
		none,
	}
	
	//GRAPHIC
	arr_grphc = noone;
	enum enu_grphc {
		winex, //rea_window_expand in other files
		guiw,
		guih,
		guicenx, //center of viewed circle
		guiceny, //center of viewed circle
		guicenx_z, //center of whole circle 1000
		guiceny_z, //center of whole circle 1000
		windesw, //window size game was ideally built for
		windesh, //window size game was ideally built for
		winusew, // actual size of window and size of room being viewed if zoom = 1
		winuseh, // actual size of window and size of room being viewed if zoom = 1
		winusear, //used aspect ratio
		cam_centx, //camera cenetr in room
		cam_centy, 
		cam_zoom,
		camera,
		last
	}
	
	arr_grphc[enu_grphc.windesw] = 1366;
	arr_grphc[enu_grphc.windesh]  = 768;
	if true{
		window_set_fullscreen(true);
	}
	
	if (os_type == os_android) {
		arr_grphc[enu_grphc.winusew] = 640;
		arr_grphc[enu_grphc.winuseh] = 360;
		bol_android_mode = true;
	}else{
		bol_android_mode = false;
		if window_get_fullscreen(){
			arr_grphc[enu_grphc.winusew] = display_get_width();
			arr_grphc[enu_grphc.winuseh] = display_get_height();
		}else{
			arr_grphc[enu_grphc.winusew] = arr_grphc[enu_grphc.windesw];
			arr_grphc[enu_grphc.winuseh] = arr_grphc[enu_grphc.windesh];
		}
	}
	arr_grphc[enu_grphc.winusear] = (arr_grphc[enu_grphc.winuseh]/arr_grphc[enu_grphc.winusew]);
	arr_grphc[enu_grphc.winex] = 1;
	arr_grphc[enu_grphc.cam_zoom] = 2;
	arr_grphc[enu_grphc.guiw] = display_get_gui_width();
	arr_grphc[enu_grphc.guih] = display_get_gui_height();
	//arr_grphc[enu_grphc.cam_centx] = [enu_grphc.winusew]/2;
	//arr_grphc[enu_grphc.cam_centy] = arr_grphc[enu_grphc.winuseh]/2;
	arr_grphc[enu_grphc.cam_centx] = arr_grphc[enu_grphc.guiw]*arr_grphc[enu_grphc.cam_zoom]/(2*arr_grphc[enu_grphc.winex]);
	arr_grphc[enu_grphc.cam_centy] = arr_grphc[enu_grphc.guih]*arr_grphc[enu_grphc.cam_zoom]/(2*arr_grphc[enu_grphc.winex]);
	arr_grphc[enu_grphc.cam_centx] = 0;
	arr_grphc[enu_grphc.cam_centy] = 0;
	scr_camera_make();
	arr_grphc[enu_grphc.guiw] = display_get_gui_width();
	arr_grphc[enu_grphc.guih] = display_get_gui_height();
	
	//WORKFLOW
	arr_wrkflw = noone;
	enum enu_wrkflw {
		st1,
		st2,
		cycle, //all players take a turn, starts at zero
		cpturn, // current player turn all players take the mobes
		autorun, //bol wait for palyer then run
		waiton, //what kind of input waiting on
		ai_shop, //bolean has ai done its shop?
		ai_dipr, //bolean has aidiplomacy recieved
		ai_dips,  //bolean has aidiplomacy sent
		ai_atck,
		winner,
		loser,
		last
	}
	
	enum enu_st1 {
		menu_main,
		menu_minor,
		game,
		last
	}
	
	enum enu_st2 {
		main_initial,
		main_load,
		main_setupsingle,
		main_setupmulti,
		minor_pause,
		minor_youwin,
		minor_youlose,
		gp_standard,
		gp_shop,
		last
	}

	for (var i = 0; i < enu_inputs.last; i += 1){
		arr_wrkflw[i] = noone;
	}
	
	arr_wrkflw[enu_wrkflw.st1] = enu_st1.menu_main;
	arr_wrkflw[enu_wrkflw.st2] = enu_st2.main_initial;
	
	
	//TEAM
	//Team must go before moves
	arr_team_m = noone; //main // one used in calculations
	arr_team_p = noone; //previous
	arr_team_a = noone; //animation
	arr_team_f = noone; //functional - the one that has completed all runs
	enum enu_team {
		name,
		color,
		order,
		cord,
		intel1,
		item,
		shop,
		alive,
		cur_health,
		max_health,
		inc_money,
		cur_money,
		damage,
		armor,
		regen,
		range,
		vision,
		lives,
		attacks, 
		shop_slots,
		grade_grades,
		alliance_tokens,
		last
	}
	
	arr_animation = noone
	arr_ani_draw = noone
	enum enu_animation {
		type,
		start,
		duration,
		curtime,
		running,
		complete,
		coo1,
		coo2,
		coo3,
		coo4,
		coo5,
		info1,
		info2,
		info3,
		info4,
		info5,
		last
	}
	
	enum enu_ani_draw {
		ani_id,
		sprite,
		subimage,
		coox,
		cooy,
		scale,
		col,
		alpha,
		last
	}
	
	enum enu_ani_type {
		test_countdown_simple,
		test_countdown_moving,
		delta_fade,
		move_simple,
		last
	}
	
	enum enu_team_item{
		itemid,
		count,
		last
	}
	
	
	//MOVES
	arr_moves = noone;
	
	enum enu_mvtype {
		shop,
		dipr,
		dips,
		atck,
		last
	}
	enum enu_mv_att{
		target,
		strength,
		applied,
		exestatus,
		last
	}
	
	enum enu_mv_dps{
		last
	}
	
	enum enu_mv_dpr{
		last	
	}	
	
	enum enu_mv_shp{
		loc,
		exestatus,
		last
	}
	enum enu_exestatus{
		notcomplete,
		complete,
		last
	}
	
	scr_eng_mv_new(noone);
	
	//COLOR
	arr_color = noone;
	enum enu_color {
		name,
		color,
		last
	}
	
	enum enu_intel {
		human,
		ai_easy,
		last
	}
	
	arr_color[0, enu_color.name] = "White";
	arr_color[0, enu_color.color] = c_white;
	arr_color[1, enu_color.name] = "Blue";
	arr_color[1, enu_color.color] = c_blue;
	arr_color[2, enu_color.name] = "Green";
	arr_color[2, enu_color.color] = c_green;
	arr_color[3, enu_color.name] = "Yellow";
	arr_color[3, enu_color.color] = c_yellow;
	arr_color[4, enu_color.name] = "Red";
	arr_color[4, enu_color.color] = c_red;
	arr_color[5, enu_color.name] = "Purple";
	arr_color[5, enu_color.color] = c_purple;
	arr_color[6, enu_color.name] = "Orange";
	arr_color[6, enu_color.color] = c_orange;
	arr_color[7, enu_color.name] = "Fuchsia";
	arr_color[7, enu_color.color] = c_fuchsia;
	arr_color[8, enu_color.name] = "Navy";
	arr_color[8, enu_color.color] = c_navy;
	arr_color[9, enu_color.name] = "Olive";
	arr_color[9, enu_color.color] = c_olive;
	arr_color[10, enu_color.name] = "Grey";
	arr_color[10, enu_color.color] = c_grey;
	arr_color[11, enu_color.name] = "Teal";
	arr_color[11, enu_color.color] = c_teal;	
	
	//DEV OPTIONS
	arr_dev = noone;
	enum enu_dev{
		main,
		easy, //game easy
		freecamera, //allow clicking to room the camera
		moreoptions, //more options appear
		last
	}
	arr_dev[enu_dev.main] = true;
	arr_dev[enu_dev.easy] = false
	arr_dev[enu_dev.freecamera] = false;
	arr_dev[enu_dev.moreoptions] = false;
	placeholder_zero = 0;
	
	//SHOP ITEMS
	arr_shop_items = noone
	enum enu_shop_prop {
		name,
		sprite,
		cost,
		effect1_des,
		effect1_mag,
		last
	}
	
	enum enu_shop_item {
		empty,
		refresh,
		attack,
		defence,
		regen,
		income,
		mexhealth,
		range,
		last	
	}
	arr_shop_items[0][0] = noone;
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.empty, "Empty", spr_sticon_empty, 3);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.refresh, "Refresh shop", spr_icon_refresh, 4);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.attack, "Attack", spr_sticon_attack ,4);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.defence, "Defence", spr_sticon_defend, 3);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.regen, "Regen", spr_sticon_regen, 4);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.income, "Money", spr_sticon_income, 3);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.mexhealth, "Max Health", spr_sticon_heath, 4);
	scr_tool_make_array_line(arr_shop_items, enu_shop_item.range, "Range", spr_sticon_range, 15);
	
	enum enu_teamstat_prop {
		name,
		sprite,
	}
	
	arr_tstats_info[0][0] = noone;
	scr_tool_make_array_line(arr_tstats_info, enu_team.cur_health, "Current Health", spr_sticon_heath);
	scr_tool_make_array_line(arr_tstats_info, enu_team.max_health, "Max Health", spr_sticon_heath);
	scr_tool_make_array_line(arr_tstats_info, enu_team.inc_money, "Income", spr_token_money);
	scr_tool_make_array_line(arr_tstats_info, enu_team.cur_money, "Gold", spr_token_money);
	scr_tool_make_array_line(arr_tstats_info, enu_team.damage, "Damage", spr_sticon_attack);
	scr_tool_make_array_line(arr_tstats_info, enu_team.armor, "Armor", spr_sticon_defend);
	scr_tool_make_array_line(arr_tstats_info, enu_team.regen, "Regen", spr_sticon_regen);
	scr_tool_make_array_line(arr_tstats_info, enu_team.range, "Range", spr_sticon_range);
	scr_tool_make_array_line(arr_tstats_info, enu_team.lives, "Lives", spr_sticon_heath);
	scr_tool_make_array_line(arr_tstats_info, enu_team.attacks, "Attack", spr_sticon_income);
	
	scr_tool_get_center_coo(true);
}