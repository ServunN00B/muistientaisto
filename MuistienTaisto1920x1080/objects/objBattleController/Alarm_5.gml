/// @description Insert description here
// You can write your code in this editor
var random_sound_defend = irandom(array_length_1d(objSoundController.sound_defend_array)-1);
objSoundController.sound_defend = objSoundController.sound_defend_array[random_sound_defend];
audio_play_sound(objSoundController.sound_defend, 1, false);
audio_sound_gain(objSoundController.sound_defend, 1, 0);

