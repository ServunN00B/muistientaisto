switch(argument0) {
	case 0:
		if (file_exists(working_directory+"\savegame.ini")) {
		ini_open("savegame.ini");
			
		//Checking if player Name exist
		if (ini_section_exists(argument1)) {
			//Parsing playerCards string to array
			var pKortit = ini_read_string(nameField,"playerCards", "0");
			if (string_length(pKortit) > 1) {
				objPerSave.playerCards = iniToArray(pKortit);
			}
			//reading rest of player data
			objPerSave.playerWins = ini_read_real(argument1, "playerWins", 0);
			objPerSave.playerLose = ini_read_real(argument1, "playerLose", 0);
			objPerSave.playerTotal = ini_read_real(argument1, "playerTotal", 0);
			objPerSave.howManyBeforeWin = ini_read_real(argument1, "howManyBeforeWin", 0);
			objPerSave.trainingWheels = ini_read_real(argument1, "trainingWheels", 0);
			var pWLratio = ini_read_real(argument1, "dsWLratio", 0);
			if (string_length(pWLratio) > 1) {
				objPerSave.dsWLratio = iniToArray(pWLratio);
			}
			

		} else {
		
			var file = file_text_open_append(working_directory+"\savegame.ini");
			var Spessu = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17";
			//Writing .ini file structure
				file_text_write_string(file, "[" + argument1 + "]");
				file_text_write_string(file, "playerCards = ");		
				file_text_write_string(file, "playerWins = ");
				file_text_write_string(file, "playerLose = ");
				file_text_write_string(file, "playerTotal = ");
				file_text_close(file);
		
			ini_open("savegame.ini");
			//Writing Player Profile
				ini_write_real(argument1,"playerCards", Spessu);
				ini_write_real(argument1,"playerWins", 0);
				ini_write_real(argument1,"playerLose", 0);
				ini_write_real(argument1,"playerTotal", 0);
			ini_write_real(argument1,"howManyBeforeWin", 0);
			ini_write_real(argument1,"trainingWheels", true);
		
			//Reading Player Profile
			objPerSave.playerName = argument1;
			//Parsing playerCards string to array
			var pKortit = ini_read_string(argument1,"playerCards", "0");
			if (string_length(pKortit) > 1) {
				objPerSave.playerCards = iniToArray(pKortit);
			}
			objPerSave.playerWins = ini_read_real(argument1, "playerWins", 0);
			objPerSave.playerLose = ini_read_real(argument1, "playerLose", 0);
			objPerSave.playerTotal = ini_read_real(argument1, "playerTotal", 0);
			objPerSave.howManyBeforeWin = ini_read_real(argument1, "howManyBeforeWin", 0);
			objPerSave.trainingWheels = ini_read_real(argument1, "trainingWheels", 0);
			var pWLratio = ini_read_real(argument1, "dsWLratio", 0);
			if (string_length(pWLratio) > 1) {
				objPerSave.dsWLratio = iniToArray(pWLratio);
			}
			
		//closing ini
			ini_close();
		}
	} else {
		var file = file_text_open_append(working_directory+"\savegame.ini");
		var Spessu = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17";
		//Writing .ini file structure
			file_text_write_string(file, "[" + argument1 + "]");
			file_text_write_string(file, "playerCards = ");		
			file_text_write_string(file, "playerWins = ");
			file_text_write_string(file, "playerLose = ");
			file_text_write_string(file, "playerTotal = ");	
			file_text_write_string(file, "howManyBeforeWin = ");
			file_text_write_string(file, "trainingWheels = ");
			file_text_write_string(file, "dsWLratio = ");
			file_text_close(file);
		
			ini_open("savegame.ini");
		//Writing Player Profile
			ini_write_real(argument1,"playerCards", Spessu);
			ini_write_real(argument1,"playerWins", 0);
			ini_write_real(argument1,"playerLose", 0);
			ini_write_real(argument1,"playerTotal", 0);
			ini_write_real(argument1,"howManyBeforeWin", 0);
			ini_write_real(argument1,"trainingWheels", true);
		
		//Reading Player Profile
	
			objPerSave.playerName = argument1;
			//Parsing playerCards string to array
			var pKortit = ini_read_string(argument1,"playerCards", "0");
			if (string_length(pKortit) > 1) {
				objPerSave.playerCards = iniToArray(pKortit);
			}
			objPerSave.playerWins = ini_read_real(argument1, "playerWins", 0);
			objPerSave.playerLose = ini_read_real(argument1, "playerLose", 0);
			objPerSave.playerTotal = ini_read_real(argument1, "playerTotal", 0);
			objPerSave.howManyBeforeWin = ini_read_real(argument1, "howManyBeforeWin", 0);
			objPerSave.trainingWheels = ini_read_real(argument1, "trainingWheels", 0);
			var pWLratio = ini_read_real(argument1, "dsWLratio", 0);
			if (string_length(pWLratio) > 1) {
				objPerSave.dsWLratio = iniToArray(pWLratio);
			}
			
		//closing ini
		ini_close();
		}
		break;
		
	case 1:
		
		break;
}