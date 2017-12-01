/// @description Insert description here
// You can write your code in this editor
if (instance_exists(objSound)) {
	ds_list_delete(objSound.allSounds,sound0);
	ds_list_delete(objMusic.allMusic ,sound0);
	if (objSound.sound) {
		if (objMusic.music) {
			audio_stop_sound(sound0);
		}
	}
}