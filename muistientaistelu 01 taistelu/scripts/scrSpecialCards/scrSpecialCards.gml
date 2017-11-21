var damageMod = 0;
var huone = noone;
var player = [];
var enemy = [];
var pSpecialEffect = noone;
var pLastingSpecialEffect = noone;
var pScore = noone;
var  pSpeCardUsed = noone;
var pSpecialCards = noone;
var eSpecialEffect = noone;
var eLastingSpecialEffect = noone;
var eScore = noone;
var eSpeCardUsed = noone;
var eSpecialCards = noone;
var oD = noone;
var oL = noone;
var pMod = noone;
var eMod = noone;

if (objPerSave.isTurn = 1) {
	pSpecialEffect = objPerSave.p1SpecialEffect;				// "p1SpecialEffect",
	pLastingSpecialEffect = objPerSave.p1LastingSpecialEffect;	// "p1LastingSpecialEffect"
	pScore = objPerSave.p1Score;								// "p1Score"
	pSpeCardUsed = objArenaController.p1SpeCardUsed;			// "p1SpeCardUsed"
	pSpecialCards = objPerSave.dsP1SpecialCards;				// "p1SpecialCards"
	
	eSpecialEffect = objPerSave.p2SpecialEffect;				// "p1SpecialEffect",
	eLastingSpecialEffect = objPerSave.p2LastingSpecialEffect;	// "p1LastingSpecialEffect"
	eScore = objPerSave.p2Score;								// "p1Score"
	eSpeCardUsed = objArenaController.p2SpeCardUsed;			// "p1SpeCardUsed"
	eSpecialCards = objPerSave.dsP2SpecialCards;				// "p1SpecialCards"
	
	if (instance_exists(objBattleController)){
		pMod = objBattleController.p1addCon;
		eMod = objBattleController.p2addCon;
	}
	
} else {
	pSpecialEffect = objPerSave.p2SpecialEffect;				// "p2SpecialEffect",
	pLastingSpecialEffect = objPerSave.p2LastingSpecialEffect;	// "p2LastingSpecialEffect"
	pScore = objPerSave.p2Score;								// "p2Score"
	pSpeCardUsed = objArenaController.p2SpeCardUsed;			// "p2SpeCardUsed"
	pSpecialCards = objPerSave.dsP2SpecialCards;				// "p2SpecialCards"
	
	eSpecialEffect = objPerSave.p1SpecialEffect;				// "p1SpecialEffect",
	eLastingSpecialEffect = objPerSave.p1LastingSpecialEffect;	// "p1LastingSpecialEffect"
	eScore = objPerSave.p1Score;								// "p1Score"
	eSpeCardUsed = objArenaController.p1SpeCardUsed;			// "p1SpeCardUsed"
	eSpecialCards = objPerSave.dsP1SpecialCards;				// "p1SpecialCards"
	
	if (instance_exists(objBattleController)){
		pMod = objBattleController.p1addCon;
		eMod = objBattleController.p2addCon;
	}
}

if (room = rooArena) {
	huone = 0;
} else {
	huone = 1;
}
	
switch(argument0) {
	case 0: //ChickenShield
		if(huone = 0) {
			pSpecialEffect = 0;
		} else {
			ds_list_replace(eScore,0,0);
		}
	break;

	case 1: //DoubleWhammy
		if(huone = 0) {
			pSpecialEffect = 1;
		} else {
			oD = ds_list_find_value(pScore,0);
			ds_list_replace(pScore,0,oD*2);
		}
	break;
	
	case 2: //The squire
		if(huone = 0) {
			pSpecialEffect = 2;
		} else {
			oL = ds_list_size(pScore);
			oD = floor(random_range(1,3));
			ds_list_replace(pScore,oL-1,oD);
		}
	break;
	
	case 3: //Lady Ingrid
		if(huone = 0) {
			pSpecialEffect = 3;
			pLastingSpecialEffect = true;
		}
	break;
	
	case 4: //Weak spot
		if(huone = 0) {
			pSpecialEffect = 4;
			pLastingSpecialEffect = true;
		}
	break;
	
	case 5: //Gruel
	break;
	
	case 6: //Payback
	if(huone = 0) {
			pSpecialEffect = 6;
			pLastingSpecialEffect = true;
		}
	break;
	
	case 7: //Tribute
		if(huone = 0) {
			pSpecialEffect = 7;
		} else {
			ds_list_add(pScore,3);
		}
	break;
	
	case 8: //Scout
	break;
	
	case 9: //Bomb
		oL = ds_list_size(eSpecialCards);
		var place = floor(random_range(3,oL));
		ds_list_insert(eSpecialCards,place,-3);
	break;
	
	case 10: //Poison
	break;

	case 11: //Chain
	break;
	
	case 12: //Time elixir
		show_message("5 sekunttia lisäaikaa");
		with(objArenaController) {
			var alarmi = alarm_get(1);
			alarm_set(1,alarmi + 5);
		}
	break;
	
	case 13: //Mist
	break;
	
	case 14: //Thief
		if(huone = 0) {
			pSpecialEffect = 14;
			pLastingSpecialEffect = true;
		} 
	break;
	
	case 15: //Curse
	break;
	
	case 16: //Vortex
		objPerSave.vortex = true;
		room_goto(battle);
	break;
	
	case 17: //Catapult
		if(huone = 0) {
			pSpecialEffect = 17;
			pLastingSpecialEffect = true;
		} 
	break;
	
}
				