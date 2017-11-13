/// @description Insert description here
// You can write your code in this editor
//string_char_at(nameField,string)
if (ds_grid_value_exists(global.playerSaveData,0,0,6,global.playerSaveSum,string(nameField))) {
	var pY = ds_grid_value_y(global.playerSaveData, 0, 0, 6, global.playerSaveSum, string(nameField));
	var pX = ds_grid_value_x(global.playerSaveData, 0, 0, 6, global.playerSaveSum, string(nameField));
	var pNAME = ds_grid_get(global.playerSaveData,pX,playerSave.pNAME);
	show_message(string(pY) + ",  " + string(pX) +", " + string(pNAME));
	show_message("Nimesi löytyi! pelaaja ID:si on " + string(pY) + " ja nimesi " + string(pNAME));
} else {
	show_message("Nimeä ei löytynyt!");
}
objPerSave.playerName = nameField;
instance_destroy(objBlock);
instance_destroy(objTextboxBG);
instance_destroy(objTextboxWall);
instance_destroy(objTextboxText);
show_debug_message(string(objPerSave.playerName));