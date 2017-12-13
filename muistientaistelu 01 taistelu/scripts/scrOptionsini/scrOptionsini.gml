//Options vars
var aiDifficultyString;
var difficultyArray = [];
var stringLength;
var pilkunpaikka;
var toAr;
var orSt;
var i = 0;
var mssg = " ";
//Options ini
if (file_exists(working_directory+"\options.ini")) {
	ini_open("options.ini");
	//Reading options
		//Basic
			objPerSave.basicStartHealth = ini_read_real("basic","hp", 20);
		
		//Turn modifiers
			objPerSave.SCardSelectTimer = ini_read_real("turn","SpecialSelectTime", 60);
			objPerSave.preturnTimer = ini_read_real("turn","PreTurnTime", 3);
			objPerSave.turnTimer = ini_read_real("turn","TurnTime", 20);
			objPerSave.flipTimer = ini_read_real("turn","FlipTime", 0.5);
			
		//Reading string to array
			aiDifficultyString =  ini_read_string("AI","aiDifficultyArray", "20, 50, 100, 0");
			orSt = aiDifficultyString;
			stringLength = string_length(aiDifficultyString);
			if (objPerSave.debugMod) {
				show_message(aiDifficultyString);
			}
			while (stringLength > 0) {
				pilkunpaikka = string_pos(",", aiDifficultyString);
				if (pilkunpaikka = 0) {
					toAr = string_copy(aiDifficultyString,1,stringLength);
					stringLength = 0;
				} else {
					toAr = string_copy(aiDifficultyString,1,pilkunpaikka);
				}
				difficultyArray[i] = real(string_digits(toAr));
				i += 1;
				aiDifficultyString = string_copy(aiDifficultyString,pilkunpaikka+1,stringLength);
				stringLength = string_length(aiDifficultyString);
				if (objPerSave.debugMod) {
					for (var j = 0; j < array_length_1d(difficultyArray); j += 1) {
						mssg = mssg + " \n " + string(difficultyArray[j]);
					}
					show_message("Original string: " + orSt + " \n Copied part is: " + toAr + "\n rest of the string is: " + aiDifficultyString +
								"\n" + mssg );
					mssg = " ";
				}
				if (pilkunpaikka = 0) {
					stringLength = 0;
				}
			}
			
		//AI modifiers
			objPerSave.aiDifficulty = ini_read_real("AI","aiDifficulty", 0);
			objPerSave.aiDifficultyArray = difficultyArray;

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
		file_text_write_string(file, "[AI]");
		file_text_write_string(file, "aiDifficulty = ");
		file_text_write_string(file, "aiDifficultyArray = ");
		file_text_close(file);
		ini_open("options.ini");
	//Writing options
		//Basic
		ini_write_real("basic","hp", 20);
		
		//Turn modifiers
		ini_write_real("turn","SpecialSelectTime", 60);
		ini_write_real("turn","PreTurnTime", 3);
		ini_write_real("turn","TurnTime", 20);
		ini_write_real("turn","FlipTime", 0.5);	
		
		//AI modifiers
		ini_write_real("AI","aiDifficultyArray", "20, 50, 100, 0");
		ini_write_real("AI","aiDifficulty", 0);

			
	//closing ini
		ini_close();
	
	ini_open("options.ini");
	//Reading options
		//Basic
		objPerSave.basicStartHealth = ini_read_real("basic","hp", 20);
		
		//Turn modifiers
		objPerSave.SCardSelectTimer = ini_read_real("turn","SpecialSelectTime", 60);
		objPerSave.preturnTimer = ini_read_real("turn","PreTurnTime", 3);
		objPerSave.turnTimer = ini_read_real("turn","TurnTime", 20);
		objPerSave.flipTimer = ini_read_real("turn","FlipTime", 0.5);
			
		//Reading string to array
			aiDifficultyString =  ini_read_string("AI","aiDifficultyArray", "20, 50, 100, 0");
			orSt = aiDifficultyString;
			stringLength = string_length(aiDifficultyString);
			if (objPerSave.debugMod) {
				show_message(aiDifficultyString);
			}
			while (stringLength > 0) {
				pilkunpaikka = string_pos(",", aiDifficultyString);
				toAr = string_copy(aiDifficultyString,1,pilkunpaikka);
				difficultyArray[i] = real(string_digits(toAr));
				i += 1;
				aiDifficultyString = string_copy(aiDifficultyString,pilkunpaikka+1,stringLength);
				stringLength = string_length(aiDifficultyString);
				if (objPerSave.debugMod) {
					for (var j = 0; j < array_length_1d(difficultyArray); j += 1) {
						mssg = mssg + " \n " + string(difficultyArray[j]);
					}
					show_message("Original string: " + orSt + " \n Copied part is: " + toAr + "\n rest of the string is: " + aiDifficultyString +
								"\n" + mssg );
					mssg = " ";
				}
				if (pilkunpaikka = 0) {
					stringLength = 0;
				}
			}
			
		//AI modifiers
			objPerSave.aiDifficulty = ini_read_real("AI","aiDifficulty", 0);
			objPerSave.aiDifficultyArray = difficultyArray;

	//closing ini
	ini_close();
}
