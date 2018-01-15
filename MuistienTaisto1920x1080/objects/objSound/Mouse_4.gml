/// @description Insert description here
// You can write your code in this editor
if (objSound.sound) {
	objSound.sound = false;
	sprite_index = sprVolumeOff;
	
	audio_play_sound(souButton, 1, false);
} else {
	objSound.sound = true;
	sprite_index = sprVolumeOn;
	
	audio_play_sound(souButton, 1, false);
}