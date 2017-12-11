/// @description Insert description here
// You can write your code in this editor
audio_play_sound(souCountdown, 1, false);

if (objArenaController.countdown < 3) {
	objArenaController.countdown += 1;
	alarm_set(5,room_speed);
}

