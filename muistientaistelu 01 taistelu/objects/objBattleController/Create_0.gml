audio_stop_sound(sound0);
alarmi = 2;
damageMod = 0;
p1addCon = false;
p2addCon = false;
if (!objPerSave.vortex) {
	alarm[0] = 3*room_speed;
} else {
	var mssg = "Joku käytti vortexin! \n molemmat saavat 5 damagea";
	show_message(mssg);
	objPerSave.vortex = false;
	objPerSave.p1Health -= 5;
	objPerSave.p2Health -= 5;
	
	ds_list_clear(objPerSave.p1Score);
	ds_list_clear(objPerSave.p2Score);
	objPerSave.p1LastingSpecialEffect = false;
	objPerSave.p2LastingSpecialEffect = false;
	objPerSave.p1SpecialEffect = -1;
	objPerSave.p2SpecialEffect = -1;

	if (objPerSave.isAttacking = 1) {
		objPerSave.isAttacking = 2;
		objPerSave.isTurn = 2;
	} else {
		objPerSave.isAttacking = 1;
		objPerSave.isTurn = 1;
	}
}