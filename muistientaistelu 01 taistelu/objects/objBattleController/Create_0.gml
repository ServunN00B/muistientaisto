view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
shake = false;


ds_list_delete(objSound.allSounds,sound0);
ds_list_delete(objMusic.allMusic ,sound0);
if (objSound.sound) {
	if (objMusic.music) {
		audio_stop_sound(sound0);
	}
}
alarmi = 2;
damageMod = 0;
p1addCon = false;
p2addCon = false;
p1EndPlace = objP1Fight.x + 300;
p2EndPlace = objP1Fight.x - 300;
p1OrigPlace = objP1Fight.x;
p2OrigPlace = objP2Fight.x;
spriteStep = 5;
firstSprite = true;
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