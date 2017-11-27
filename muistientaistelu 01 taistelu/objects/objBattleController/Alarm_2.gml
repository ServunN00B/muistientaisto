/// @description BattleSprite movement
// You can write your code in this editor
var p1place = objP1Fight.x
if (firstSprite) {
	with(objP1Fight) {
		sprite_index = objBattleController.p1sprite;
	}
	with(objP2Fight) {
		sprite_index = objBattleController.p2sprite;
	}
	firstSprite = false;
}

if (p1EndPlace>p1place) {
	objP1Fight.x += spriteStep;
	objP2Fight.x -= spriteStep;
	alarm_set(2,1);
}