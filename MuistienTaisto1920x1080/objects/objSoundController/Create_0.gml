/// @description Insert description here
// You can write your code in this editor
randomize();

sound_theme_array = [souTheme1, souTheme2, souTheme3, souTheme4, souTheme5];
sound_theme = souTheme1;

sound_pretheme_array = [souPreTheme1, souPreTheme2, souPreTheme3];
sound_pretheme = souPreTheme1;

sound_attack_array = [souGruntAttack1, souGruntAttack2, souGruntAttack3, souGruntAttack4, souGruntAttack5, souGruntAttack6];
sound_attack = souGruntAttack1;

sound_defend_array = [souGruntDefend1, souGruntDefend2, souGruntDefend3, souGruntDefend4];
sound_defend = souGruntDefend1;

var random_sound_pretheme = irandom(array_length_1d(objSoundController.sound_pretheme_array)-1);
objSoundController.sound_pretheme = objSoundController.sound_pretheme_array[random_sound_pretheme];
audio_play_sound(objSoundController.sound_pretheme, 1, true);
audio_sound_gain(objSoundController.sound_pretheme, 0.5, 0);