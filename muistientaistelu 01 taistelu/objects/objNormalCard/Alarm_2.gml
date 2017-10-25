/// @description Insert description here
// You can write your code in this editor
switch(objArenaController.isTurn) {
	case 1:
		x = objPL1CardHolder.x;
		y = objPL1CardHolder.y;

		with(objArenaController.instID){
			x = objPL1CardHolder.x;
			y = objPL1CardHolder.y;
		}
		break;
	case 2:
		x = objPL2CardHolder.x;
		y = objPL2CardHolder.y;

		with(objArenaController.instID){
			x = objPL2CardHolder.x;
			y = objPL2CardHolder.y;
		}
		break;
	default:
		break;
}
