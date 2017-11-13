	//Loading Special card data file to game
	var file = file_text_open_read(working_directory+"\specialcards.json");
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
	global.totalSpecialCards = ds_list_size(list);
	global.specialCardData = ds_grid_create(global.totalSpecialCards, 7)
	enum SpecialEnum {ID,NAME,VALUE,TYPE,PRIORITY,SPRITE,TEXT}
	//Placing json data to Global variable
	for (var i = 0; i < global.totalSpecialCards; i++) {
		var theEntry = ds_list_find_value(list, i);
		global.specialCardData[# i, SpecialEnum.ID] = theEntry[? "ID"];
		global.specialCardData[# i, SpecialEnum.NAME] = theEntry[? "NAME"];
		global.specialCardData[# i, SpecialEnum.VALUE] = theEntry[? "VALUE"];
		global.specialCardData[# i, SpecialEnum.TYPE] = theEntry[? "TYPE"];
		global.specialCardData[# i, SpecialEnum.PRIORITY] = theEntry[? "PRIORITY"];
		global.specialCardData[# i, SpecialEnum.SPRITE] = theEntry[? "SPRITE"];
		global.specialCardData[# i, SpecialEnum.TEXT] = theEntry[? "TEXT"];
	}
	//Destroy unnecessary lists and maps
	ds_list_destroy(list);
	ds_map_destroy(sdecoded);
	