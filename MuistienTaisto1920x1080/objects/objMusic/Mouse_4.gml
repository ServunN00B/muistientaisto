/// @description Insert description here
// You can write your code in this editor
if (music) {
	music = false;
	sprite_index = sprMusicOff;
	
	audio_play_sound(souButton, 1, false);
	
	audio_sound_gain(objSoundController.sound_theme, 0, 1*1000);
	audio_sound_gain(objSoundController.sound_pretheme, 0, 1*1000);
	audio_sound_gain(souBattle1, 0, 1*1000);
} else {
	music = true;
	sprite_index = sprMusicOn;
	
	audio_play_sound(souButton, 1, false);
	
	audio_sound_gain(objSoundController.sound_theme, 0.5, 1*1000);
	audio_sound_gain(objSoundController.sound_pretheme, 0.5, 1*1000);
	audio_sound_gain(souBattle1, 1, 1*1000);
}