/// @description Insert description here
// You can write your code in this editor
if (objPerSave.isAttacking < 2) {
	objPerSave.isAttacking = 2;
	objPerSave.isTurn = 2;
} else {
	objPerSave.isAttacking = 1;
	objPerSave.isTurn = 1;
}
room_goto(1);