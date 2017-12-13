/// @description Insert description here
// You can write your code in this editor
depth = 10;
//Fade out
fadeTime = 3 * room_speed; //Seconds
//Fade in
fadeInTime = 1 * room_speed; //Seconds

onePicTime = 15 * room_speed; //Seconds
stepSizeX = 542 / onePicTime;
stepSizeY = 310 / onePicTime;
origStart = self.y;
origScaleX = image_xscale;
origScaleY = image_yscale;
stepScaleX = (image_xscale - 0.7) / onePicTime;
stepScaleY = (image_yscale - 0.71) / onePicTime;
if (room = rooCredits) {
	rollCreds = true;
	alarm_set(2, onePicTime);
	alarm_set(0, alarm_get(2) - fadeTime);
} else {
	rollCreds = false;
}