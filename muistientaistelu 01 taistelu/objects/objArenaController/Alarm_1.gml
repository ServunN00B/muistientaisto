/// @description End of turn alarm


//show_message("Laita arvot ylös");
instance_destroy(objBackFlash);
window_set_cursor(cr_default);
//show_message("End of turn");
canTurn = false;
// Log files go to C:\Users\*username*\AppData\Local\muistientaistelu_01_taistelu
var debudi = file_text_open_append(working_directory + "debudit.txt");
var plop =  "Pelaaja " + string(objPerSave.isTurn) + ". Parien määrä " + string(objNormalCard.pairs) + " : ";
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
//show_message(objNormalCard.pairs);
		
//Empty the score
if (objPerSave.AI) {
	if (objArenaController.aiDifficulty < (array_length_1d(objAIdriver.aiDifficultyArray) - 1)) {
		if (objArenaController.aiRoundLimitNow < 1) {
			objArenaController.aiRoundKA = objArenaController.aiRoundKA/objArenaController.aiRoundLimit;
			file_text_write_string(debudi, "Vaikeusaste " + string(objArenaController.aiDifficulty) + " prosentilla "  + string(objAIdriver.aiDifficultyArray[objArenaController.aiDifficulty]) + "% KA " + string(objArenaController.aiRoundKA));
			file_text_writeln(debudi);
			objArenaController.aiRoundKA = 0;
			objArenaController.aiDifficulty +=1;
			objArenaController.aiRoundLimitNow = objArenaController.aiRoundLimit; 
		} else { 
			objArenaController.aiRoundLimitNow -=1;
			objArenaController.aiRoundKA += plop2;
		}
	} else { 
		if (objArenaController.aiRoundLimitNow < 1) {
			objArenaController.aiRoundKA = objArenaController.aiRoundKA/objArenaController.aiRoundLimit;
			file_text_write_string(debudi, "Vaikeusaste " + string(objArenaController.aiDifficulty) + " prosentilla "  + string(objAIdriver.aiDifficultyArray[objArenaController.aiDifficulty]) + "% KA " + string(objArenaController.aiRoundKA));
			file_text_writeln(debudi);
			file_text_close(debudi);
			objArenaController.aiRoundKA = 0;
			objArenaController.aiDifficulty = 0;
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


file_text_close(debudi);
//Changin turn
if (objPerSave.AI) { scrTurnChangePureAI(); } else { scrTurnChange(); }
