/// @description Insert description here
// You can write your code in this editor
if (objSound.sound) {
	audio_stop_all()
	objSound.sound = false;
	sprite_index = sprVolumeOff;
} else {
	objSound.sound = true;
	sprite_index = sprVolumeOn;
	if (!ds_list_empty(allSounds)) {
		for (var i = 0; i < ds_list_size(allSounds); i +=1) {
			audio_play_sound(ds_list_find_value(allSounds,i),1,true);	
		}
	}
}