/// @description BattleSprite movement
// You can write your code in this editor
var p1place = objP1Fight.x

if (p1EndPlace==p1place)
{
	shake = true;
	alarm_set(3,10);
}

	if (p1place = p1EndPlace - spriteStep * 6) {
		with(objP1Fight) {
			sprite_index = objBattleController.p1sprite;
		}
		with(objP2Fight) {
			sprite_index = objBattleController.p2sprite;
		}
	
	}


if (p1EndPlace>p1place) {
	objP1Fight.x += spriteStep;
	objP2Fight.x -= spriteStep;
	alarm_set(2,1);
}
