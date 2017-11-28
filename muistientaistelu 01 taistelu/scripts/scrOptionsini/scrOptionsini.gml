//Options vars
var aiDifficultyString;
var difficultyArray = [];
var stringLength;
var pilkunpaikka;

//Options ini
if (file_exists(working_directory+"\options.ini")) {
	ini_open("options.ini");
	//Reading options
		//Basic
			objPerSave.basicStartHealth = ini_read_real("basic","hp", 20);
		
		//Turn modifiers
			objPerSave.SCardSelectTimer = ini_read_real("turn","SpecialSelectTime", 15);
			objPerSave.preturnTimer = ini_read_real("turn","PreTurnTime", 3);
			objPerSave.turnTimer = ini_read_real("turn","TurnTime", 20);
			objPerSave.flipTimer = ini_read_real("turn","FlipTime", 1);
			objPerSave.aiDifficulty = ini_read_real("AI","aiDifficulty", 0);
			
		//AI modifiers
			aiDifficultyString =  ini_read_string("AI","aiDifficulty", "20, 40, 60, 80, 100");
			stringLength = string_length(aiDifficultyString);
			while (stringLength > 0) {
				pilkunpaikka = string_pos(",", aiDifficultyString);
			}
			objPerSave.aiDifficultyArray = [20, 40, 60, 80, 100];

	//closing ini
	ini_close();
} else {
	var file = file_text_open_append(working_directory+"\options.ini");
	//Writing .ini file structure
		file_text_write_string(file, "[basic]");
		file_text_write_string(file, "hp = ");
		file_text_write_string(file, "[turn]");
		file_text_write_string(file, "SpecialSelectTime = ");
		file_text_write_string(file, "PreTurnTime = ");
		file_text_write_string(file, "TurnTime = ");
		file_text_write_string(file, "FlipTime = ");
		file_text_close(file);
		ini_open("options.ini");
	//Writing options
		//Basic
		ini_write_real("basic","hp", 40);
		
		//Turn modifiers
		ini_write_real("turn","SpecialSelectTime", 15);
		ini_write_real("turn","PreTurnTime", 3);
		ini_write_real("turn","TurnTime", 20);
		ini_write_real("turn","FlipTime", 1);
			
	//closing ini
		ini_close();
	
	ini_open("options.ini");
	//Reading options
		//Basic
		objPerSave.basicStartHealth = ini_read_real("basic","hp", 20);
		
		//Turn modifiers
		objPerSave.SCardSelectTimer = ini_read_real("turn","SpecialSelectTime", 15);
		objPerSave.preturnTimer = ini_read_real("turn","PreTurnTime", 3);
		objPerSave.turnTimer = ini_read_real("turn","TurnTime", 20);
		objPerSave.flipTimer = ini_read_real("turn","FlipTime", 1);

	//closing ini
	ini_close();
}
