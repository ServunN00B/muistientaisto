var damageMod = 0;
var huone;
var player = [];
var enemy = [];
//Player vars
var pSpecialEffect;
var pLastingSpecialEffect;
var pScore;
var pSpeCardUsed;
var pSpecialCards;
var pHealth;

//Enemy vars
var eSpecialEffect;
var eLastingSpecialEffect;
var eScore;
var eSpeCardUsed;
var eSpecialCards;
var eHealth;

//Other vars
var oD;
var oL;
var pMod;
var eMod;

if (objPerSave.isTurn = 1) {
	pSpecialEffect = objPerSave.p1SpecialEffect;				// "p1SpecialEffect",
	pLastingSpecialEffect = objPerSave.p1LastingSpecialEffect;	// "p1LastingSpecialEffect"
	pScore = objPerSave.p1Score;								// "p1Score"
	pSpecialCards = objPerSave.dsP1SpecialCards;				// "p1SpecialCards"
	pHealth = objPerSave.p1Health;
	
	eSpecialEffect = objPerSave.p2SpecialEffect;				// "p1SpecialEffect",
	eLastingSpecialEffect = objPerSave.p2LastingSpecialEffect;	// "p1LastingSpecialEffect"
	eScore = objPerSave.p2Score;								// "p1Score"
	eSpecialCards = objPerSave.dsP2SpecialCards;				// "p1SpecialCards"
	eHealth = objPerSave.p2Health;
	
	if (instance_exists(objArenaController)){
	pSpeCardUsed = objArenaController.p1SpeCardUsed;			// "p1SpeCardUsed"
	eSpeCardUsed = objArenaController.p2SpeCardUsed;			// "p1SpeCardUsed"
	}
	
	if (instance_exists(objBattleController)){
		pMod = objBattleController.p1addCon;
		eMod = objBattleController.p2addCon;
	}
	
} else {
	pSpecialEffect = objPerSave.p2SpecialEffect;				// "p2SpecialEffect",
	pLastingSpecialEffect = objPerSave.p2LastingSpecialEffect;	// "p2LastingSpecialEffect"
	pScore = objPerSave.p2Score;								// "p2Score"
	pSpecialCards = objPerSave.dsP2SpecialCards;				// "p2SpecialCards"
	pHealth = objPerSave.p2Health;
	
	eSpecialEffect = objPerSave.p1SpecialEffect;				// "p1SpecialEffect",
	eLastingSpecialEffect = objPerSave.p1LastingSpecialEffect;	// "p1LastingSpecialEffect"
	eScore = objPerSave.p1Score;								// "p1Score"
	eSpecialCards = objPerSave.dsP1SpecialCards;				// "p1SpecialCards"
	eHealth = objPerSave.p1Health;
	
	if (instance_exists(objArenaController)){
	pSpeCardUsed = objArenaController.p2SpeCardUsed;			// "p2SpeCardUsed"
	eSpeCardUsed = objArenaController.p1SpeCardUsed;			// "p1SpeCardUsed"
	}
	
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
			pLastingSpecialEffect = true;
		} else {
			ds_list_replace(eScore,0,0);
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
		}
	break;

	case 1: //DoubleWhammy
		if(huone = 0) {
			pSpecialEffect = 1;
			pLastingSpecialEffect = true;
		} else {
			oD = ds_list_find_value(pScore,0);
			ds_list_replace(pScore,0,oD*2);
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
		}
	break;
	
	case 2: //The squire
		if(huone = 0) {
			pSpecialEffect = 2;
			pLastingSpecialEffect = true;
		} else {
			oL = ds_list_size(pScore);
			oD = floor(random_range(1,3));
			ds_list_replace(pScore,oL-1,oD);
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
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
		if(huone = 0) {
			pSpecialEffect = 5;
			pLastingSpecialEffect = true;
		} else {
			if (eLastingSpecialEffect) {
				eHealth = eHealth - 3;
			}
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
		}
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
			pLastingSpecialEffect = true;
		} else {
			ds_list_add(pScore,3);
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
		}
	break;
	
	case 8: //Scout
	break;
	
	case 9: //Bomb
		if(huone = 0) {
			oL = ds_list_size(eSpecialCards);
			var place = floor(random_range(3,oL));
			ds_list_insert(eSpecialCards,place,-3);
			pSpecialEffect = 9;
			pLastingSpecialEffect = true;
		} else {
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
		}
	break;
	
	case 10: //Poison
	break;

	case 11: //Chain
	break;
	
	case 12: //Time elixir
		if(huone = 0) {
			//show_message("5 sekunttia lisäaikaa");
			with(objArenaController) {
				var alarmi = alarm_get(1);
				alarm_set(1,alarmi + 5*room_speed);
			}
			pSpecialEffect = 12;
			pLastingSpecialEffect = true;
		} else {
			pSpecialEffect = -1;
			pLastingSpecialEffect = false;
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

if (objPerSave.isTurn = 1) {
	objPerSave.p1SpecialEffect = pSpecialEffect;				// "p1SpecialEffect",
	objPerSave.p1LastingSpecialEffect =	pLastingSpecialEffect;	// "p1LastingSpecialEffect"
	objPerSave.p1Score = pScore;								// "p1Score"
	objPerSave.dsP1SpecialCards = pSpecialCards;				// "p1SpecialCards"
	objPerSave.p1Health = pHealth;								// "p1Health"
	
	objPerSave.p2SpecialEffect = eSpecialEffect;				// "p2SpecialEffect",
	objPerSave.p2LastingSpecialEffect = eLastingSpecialEffect;	// "p2LastingSpecialEffect"
	objPerSave.p2Score = eScore;								// "p2Score"
	objPerSave.dsP2SpecialCards = eSpecialCards;				// "p2SpecialCards"
	objPerSave.p2Health = eHealth;								// "p2Health"
	
	if (instance_exists(objArenaController)){
	objArenaController.p1SpeCardUsed = pSpeCardUsed;			// "p1SpeCardUsed"
	objArenaController.p2SpeCardUsed = eSpeCardUsed;			// "p1SpeCardUsed"
	}
	
	if (instance_exists(objBattleController)){
		objBattleController.p1addCon = pMod;
		objBattleController.p2addCon = eMod;
	}
	
} else {
	objPerSave.p2SpecialEffect = pSpecialEffect;				// "p2SpecialEffect",
	objPerSave.p2LastingSpecialEffect = pLastingSpecialEffect;	// "p2LastingSpecialEffect"
	objPerSave.p2Score = pScore;								// "p2Score"
	objPerSave.dsP2SpecialCards = pSpecialCards;				// "p2SpecialCards"
	objPerSave.p2Health = pHealth;								// "p2Health"
	
	objPerSave.p1SpecialEffect = eSpecialEffect;				// "p1SpecialEffect",
	objPerSave.p1LastingSpecialEffect = eLastingSpecialEffect;	// "p1LastingSpecialEffect"
	objPerSave.p1Score = eScore;								// "p1Score"
	objPerSave.dsP1SpecialCards = eSpecialCards;				// "p1SpecialCards"
	objPerSave.p1Health = eHealth;								// "p1Health"
	
	if (instance_exists(objArenaController)){
	objArenaController.p2SpeCardUsed = pSpeCardUsed;			// "p2SpeCardUsed"
	objArenaController.p1SpeCardUsed = eSpeCardUsed;			// "p2SpeCardUsed"
	}
	
	if (instance_exists(objBattleController)){
		objBattleController.p1addCon = pMod;
		objBattleController.p2addCon = eMod;
	}
}

objPerSave.scriptDone = true;