/// @description Insert description here
// You can write your code in this editor
cardsOnTable = ds_list_create();
speCardsOnTable = ds_list_create();
speValueOnTable = ds_list_create();
cardsOnMemory = ds_list_create();
zeroOnMemory = ds_list_create();
aiDifficultyArray = objPerSave.aiDifficultyArray;
spePriority = ds_list_create();
canUseSpecial = false;
//instance_create_layer(60,60,layer_get_id("Instances"),objBlock);
arenaAlarm0 = 1;
normalAlarm0 = 0;
go = true;
goTimer = objPerSave.aiDifficultyArray[objPerSave.aiDifficulty] / 2;

/*
switch(objPerSave.aiDifficulty) {
	case 0:
		goTimer = 40;
	break;
	
	case 1:
		goTimer = 25;
	break;
	
	case 2:
		goTimer = 10;
	break;
	
	case 3:
		goTimer = 35;
	break;
}
*/
	
aiCardValue = 0;
aiPair = undefined;
aiIsSame = undefined;
xMarks = -1;
j = 0;
turn = 1;
AItxt = file_text_open_append(working_directory + "AI.txt");
aiLastPick = undefined;
aiStLastPick = undefined;
remember = false;
memfail = false;
lastPair = [undefined,undefined];
if (objPerSave.debugMod) {
	file_text_write_string(AItxt, "*****************************");
	file_text_writeln(AItxt);
	file_text_write_string(AItxt, "AI vuoro alkaa");
	file_text_writeln(AItxt);
	file_text_write_string(AItxt, "*****************************");
	file_text_writeln(AItxt);
}