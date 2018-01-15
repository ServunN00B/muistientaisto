/// @description Insert description here
// You can write your code in this editor
alarmi -= 1;
var pSpecialEffect = noone;
var pLastEffect = noone;
if (objPerSave.isTurn = 1) {
	pSpecialEffect = objPerSave.p1SpecialEffect;
	pLastEffect = objPerSave.p1LastingSpecialEffect;
} else {
	pSpecialEffect = objPerSave.p2SpecialEffect;
	pLastEffect = objPerSave.p2LastingSpecialEffect;
}
if (!pLastEffect){
	if(pSpecialEffect >= 0) {
		scrSpecialCards(pSpecialEffect);
	}
}

if (alarmi = 0) {
	alarm[0] = 2*room_speed;
	
} else {
	if (objPerSave.isTurn = 1) {
		objPerSave.isTurn = 2;
	} else {
		objPerSave.isTurn = 1;
	}
	alarm[1] = 15;
}