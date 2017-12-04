/// @description Insert description here
// You can write your code in this editor
if (basicValue != objPerSave.aiDifficulty) {
	basicValue = objPerSave.aiDifficulty
	switch(basicValue) {
		case 0:
			aiDifficultyName = "Easy";
		break;
		
		case 1:
			aiDifficultyName = "Normal";
		break;
		
		case 2:
			aiDifficultyName = "Hard";
		break;
		
		case 3:
			aiDifficultyName = "Adaptive";
		break;
	}
}