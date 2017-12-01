/// @description Insert description here
// You can write your code in this editor
if (room != rooMain) {
	objPerSave.firstTurn = true;
	ds_list_clear(objPerSave.p1Score);
	ds_list_clear(objPerSave.p2Score);
	objPerSave.p1LastingSpecialEffect = false;
	objPerSave.p2LastingSpecialEffect = false;
	objPerSave.p1SpecialEffect = -1;
	objPerSave.p2SpecialEffect = -1;
	objPerSave.isAttacking = 0;
	ds_list_clear(objPerSave.dsP1SpecialCards);
	ds_list_clear(objPerSave.dsP2SpecialCards);
	ds_list_clear(objPerSave.cardsInUse);
	room_goto(rooMain);
} else {
	instance_create_depth(room_width/2,60,depth - 5, objStatsScreen);
}
		