/// @description Insert description here
// You can write your code in this editor
audio_play_sound(souButton, 1, false);
audio_sound_gain(souButton, 1, 0);

with(objArenaController){
	alarm_set(2,1);
	alarm_set(4,-1);
}
