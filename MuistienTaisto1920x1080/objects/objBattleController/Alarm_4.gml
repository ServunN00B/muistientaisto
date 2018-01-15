/// @description Insert description here
// You can write your code in this editor
var random_sound_attack = irandom(array_length_1d(objSoundController.sound_attack_array)-1);
objSoundController.sound_attack = objSoundController.sound_attack_array[random_sound_attack];
audio_play_sound(objSoundController.sound_attack, 1, false);
audio_sound_gain(objSoundController.sound_attack, 1, 0);
alarm_set(5,room_speed/2);
