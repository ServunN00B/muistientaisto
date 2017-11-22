//Loading Player data file to game
var file = file_text_open_read(working_directory+"\playerSave.json");
var theData = "";
//Reading Special card data file in var
while (!file_text_eof(file)){
	theData += file_text_read_string(file);
	file_text_readln(file);	
}
//Closing data file
file_text_close(file);
//Decoding Specialcards data file from json
var sdecoded = json_decode(theData);
var list = ds_map_find_value(sdecoded, "default");
enum playerSave {pID,pNAME,pCOINS,pWIN,pLOSE,pTOTAL};
global.playerSaveSum = ds_list_size(list);
global.playerSaveData = ds_grid_create(global.playerSaveSum, 6);

//Placing player data from json to global variable
for (var i = 0; i < global.playerSaveSum; i++) {
	var theEntry = ds_list_find_value(list, i);
	global.playerSaveData[# i, playerSave.pID] = theEntry[? "pID"];
	global.playerSaveData[# i, playerSave.pNAME] = theEntry[? "pNAME"];
	global.playerSaveData[# i, playerSave.pCOINS] = theEntry[? "pCOINS"];
	global.playerSaveData[# i, playerSave.pWIN] = theEntry[? "pWIN"];
	global.playerSaveData[# i, playerSave.pLOSE] = theEntry[? "pLOSE"];
	global.playerSaveData[# i, playerSave.pTOTAL] = theEntry[? "pTOTAL"];
}
//Destroy unnecessary lists and maps
ds_list_destroy(list);
ds_map_destroy(sdecoded);
