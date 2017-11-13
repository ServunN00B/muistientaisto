//SpessuSpr = [sprChicken, sprDouble, sprWeakSpot, sprPoison, sprCurse, sprVortex];
damage = 0;
switch(argument0) {
	case 0: //ChickenShield
		if (objPerSave.isAttacking < 2) {
			ds_list_replace(objPerSave.p1Score,0,0);
		} else {
			ds_list_replace(objPerSave.p2Score,0,0);
		}
		break;
	
	case 1: //DoubleWhammy
		if (objPerSave.isAttacking < 2) {
			var isku = ds_list_find_value(objPerSave.p1Score,0);
			ds_list_replace(objPerSave.p1Score,0,isku*2);
		} else {
			var isku = ds_list_find_value(objPerSave.p2Score,0);
			ds_list_replace(objPerSave.p2Score,0,isku*2);
		}
		break;
	
	case 2: //Weakspot
		if (room == 2){
			if (damage > 0) {damage = damage + 2;}
		} else {
			if (objPerSave.isTurn < 2) {
				objPerSave.p1SpecialEffect = argument0;
			} else {
				objPerSave.p2SpecialEffect = argument0;
			}
		}
		break;
		
	case 3: //Poison
		if (room < 2) {
			if (objPerSave.isTurn < 2) {
				objPerSave.p1SpecialEffect = argument0;
				objPerSave.p1LastingSpecialEffect = argument0;
			} else {
				objPerSave.p2SpecialEffect = argument0;
				objPerSave.p2LastingSpecialEffect = argument0;
			}
			break;
		}
		break;
		
	case 4: //Curse
		show_message("CURSE YOU");
		break;
	
	case 5: //Vortex
		ds_list_clear(objPerSave.p1Score);
		ds_list_clear(objPerSave.p2Score);
		objPerSave.p1SpecialEffect = argument0;
		objPerSave.p2SpecialEffect = argument0;
		break;
}
				