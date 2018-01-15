view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
shake = false;


showdmgtext = false;

pl1Hbar = objPL1Healthbar.image_xscale;
pl2Hbar = objPL2Healthbar.image_xscale;

damageDone = 0;

alarmi = 2;
damageMod = 0;
p1addCon = false;
p2addCon = false;
p1EndPlace = objP1Fight.x + (300-4*32);
p2EndPlace = objP1Fight.x - (300-5*32);
p1OrigPlace = objP1Fight.x;
p2OrigPlace = objP2Fight.x;
spriteStep = 5;
firstSprite = true;
battleEnd = false;

audio_stop_sound(objSoundController.sound_theme);
audio_play_sound(souBattle1, 1, true);
audio_sound_gain(souBattle1, 0, 0);
if objMusic.music {
	audio_sound_gain(souBattle1, 1, 1*1000);
}

if (!objPerSave.vortex) {
	alarm[0] = 1*room_speed;
} else {
	
	//Incase vortex
	var p1spriteIdle = noone;
	var p2spriteIdle = noone;
	var spriteSize = 0.5;
	if (objPerSave.isAttacking = 1) {
		p1sprite = sprAnimPlayerAttackDagger;
		p1spriteIdle = sprAnimPlayerAttackDagger;
		p2sprite = sprAnimEnemyDefendStoolIdle;
		p2spriteIdle = sprAnimEnemyDefendStoolIdle;
	} else {
		p1sprite = sprAnimPlayerDefendStoolIdle;
		p1spriteIdle = sprAnimPlayerDefendStoolIdle;
		p2sprite = sprAnimEnemyAttackDaggerIdle;
		p2spriteIdle = sprAnimEnemyAttackDaggerIdle;
	}
	
	with(objP1Fight) {
		sprite_index = p1spriteIdle;
		image_xscale = spriteSize;
		image_yscale = spriteSize;
	}
	with(objP2Fight) {
		sprite_index = p2spriteIdle;
		image_xscale = spriteSize;
		image_yscale = spriteSize;
	}

	var mssg = "Joku käytti vortexin! \n molemmat saavat 5 damagea";
	//show_message(mssg);
	objPerSave.vortex = false;
	objPerSave.p1Health -= 5;
	objPerSave.p2Health -= 5;
	if(objPerSave.p1Health <= 0)
	{
		objBattleEnd.sprite_index = sprDefeat;
		objBattleEnd.visible = true;
		objContinue.visible = true;
		battleEnd = true;
	}
	
	if(objPerSave.p2Health <= 0)
	{
		objBattleEnd.visible = true;
		objContinue.visible = true;
		battleEnd = true;
	}

	
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