function scr_tool_make_array_line(){
	
	var rea_line = argument[1];
	for (var i = 2; i < argument_count; i += 1){
		argument[0][rea_line][i-2] = argument[i];
	}
}