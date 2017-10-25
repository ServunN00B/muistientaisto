/// @description Insert description here
// You can write your code in this editor
switch(objArenaController.isTurn) {
	case 1:
		
		if(objNormalCard.pairs > 3) {
			x = objPL1CardHolder.x+((objNormalCard.pairs-4))*100;
			y = objPL1CardHolder.y+ 150;

			with(objArenaController.instID){
				x =  objPL1CardHolder.x+((objNormalCard.pairs-4))*100;
				y = objPL1CardHolder.y+ 150;
			}
		} else {
			
			x = objPL1CardHolder.x+(objNormalCard.pairs-1)*100;
			y = objPL1CardHolder.y;

			with(objArenaController.instID){
				x = objPL1CardHolder.x+(objNormalCard.pairs-1)*100;
				y = objPL1CardHolder.y;
			}
		}
		
		
		break;
	case 2:
		if(objNormalCard.pairs > 3) {
			x = objPL2CardHolder.x+(objNormalCard.pairs-4)*100;
			y = objPL2CardHolder.y+ 150;

			with(objArenaController.instID){
				x = objPL2CardHolder.x+(objNormalCard.pairs-4)*100;
				y = objPL2CardHolder.y+ 150;
			}
		}else {
		
			x = objPL2CardHolder.x+(objNormalCard.pairs-1)*100;
			y = objPL2CardHolder.y;

			with(objArenaController.instID){
				x = objPL2CardHolder.x+(objNormalCard.pairs-1)*100;
				y = objPL2CardHolder.y;
			}
		}
		break;
	default:
		break;
}
