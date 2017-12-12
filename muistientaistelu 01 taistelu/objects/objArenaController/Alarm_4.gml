/// @description Insert description here
// You can write your code in this editor
if objSound.sound {
	audio_play_sound(souCountdown, 1, false);
	audio_sound_gain(souCountdown, 1, 0);
}

if (objArenaController.countdown < 3) {
	objArenaController.countdown += 1;
	alarm_set(4,room_speed);
}