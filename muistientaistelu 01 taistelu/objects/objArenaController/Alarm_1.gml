/// @description End of turn alarm


instance_destroy(objBackFlash);
canTurn = false;
// Log files go to C:\Users\*username*\AppData\Local\muistientaistelu_01_taistelu
if (objPerSave.debugMod) {
	var debudi = file_text_open_append(working_directory + "debudit.txt");
	if (objPerSave.AI) {
		if (objPerSave.isTurn = 1) {
			var plop =  "Pelaaja " + string(objPerSave.isTurn) + ". Parien määrä " + string(objNormalCard.pairs) + " : ";
		} else {
			var plop =  "Tekoäly (Pelaaja 2). Parien määrä " + string(objNormalCard.pairs) + " : ";
		}
	} else {
		var plop =  "Pelaaja " + string(objPerSave.isTurn) + ". Parien määrä " + string(objNormalCard.pairs) + " : ";
	}
	var plop2 = 0;
	var vuorossa;
	if (objPerSave.isTurn = 1) { vuorossa = objPerSave.p1Score } else { vuorossa = objPerSave.p2Score }

	for (var i = 0; i<ds_list_size(vuorossa); i+=1) {
		plop = plop + string(ds_list_find_value(vuorossa, i)) + ", ";
		plop2 = plop2 + ds_list_find_value(vuorossa, i);
	}
	plop = plop + " = " + string(plop2);
	file_text_write_string(debudi, plop);
	file_text_writeln(debudi);

		
//Empty the score
/*
if (objPerSave.AI) {
	if (objPerSave.aiDifficulty < (array_length_1d(objAIdriver.aiDifficultyArray) - 1)) {
		if (objArenaController.aiRoundLimitNow < 1) {
			objArenaController.aiRoundKA = objArenaController.aiRoundKA/objArenaController.aiRoundLimit;
			file_text_write_string(debudi, "Vaikeusaste " + string(objPerSave.aiDifficulty) + " prosentilla "  + string(objAIdriver.aiDifficultyArray[objPerSave.aiDifficulty]) + "% KA " + string(objArenaController.aiRoundKA));
			file_text_writeln(debudi);
			objArenaController.aiRoundKA = 0;
			objPerSave.aiDifficulty +=1;
			objArenaController.aiRoundLimitNow = objArenaController.aiRoundLimit; 
		} else { 
			objArenaController.aiRoundLimitNow -=1;
			objArenaController.aiRoundKA += plop2;
		}
	} else { 
		if (objArenaController.aiRoundLimitNow < 1) {
			objArenaController.aiRoundKA = objArenaController.aiRoundKA/objArenaController.aiRoundLimit;
			file_text_write_string(debudi, "Vaikeusaste " + string(objPerSave.aiDifficulty) + " prosentilla "  + string(objAIdriver.aiDifficultyArray[objPerSave.aiDifficulty]) + "% KA " + string(objArenaController.aiRoundKA));
			file_text_writeln(debudi);
			file_text_close(debudi);
			objArenaController.aiRoundKA = 0;
			objPerSave.aiDifficulty = 0;
			objArenaController.aiRoundLimitNow = objArenaController.aiRoundLimit; 
		} else { 
			objArenaController.aiRoundLimitNow -=1;
			objArenaController.aiRoundKA += plop2;
		}
	}
}
if(objPerSave.AI) {
	ds_list_clear(objPerSave.p2Score);
	objArenaController.p2ScoreInt = 0;
	objNormalCard.pairs = 0;
}

*/

	file_text_close(debudi);
}
//Changin turn
scrTurnChange();
//if (objPerSave.AI) { scrTurnChangePureAI(); } else { scrTurnChange(); }
