/// @description Insert description here
// You can write your code in this editor
if objMusic.music {
	audio_sound_gain(objSoundController.sound_theme, 0, 1000*2);
}
else {
	audio_sound_gain(objSoundController.sound_theme, 0, 0);
}