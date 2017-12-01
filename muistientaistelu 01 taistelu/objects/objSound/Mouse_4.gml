/// @description Insert description here
// You can write your code in this editor
if (sound) {
	audio_stop_all()
	sound = false;
	sprite_index = sprVolumeOff;
} else {
	sound = true;
	sprite_index = sprVolumeOn;
	if (!ds_list_empty(allSounds)) {
		for (var i = 0; i < ds_list_size(allSounds); i +=1) {
			audio_play_sound(ds_list_find_value(allSounds,i),1,true);	
		}
	}
}