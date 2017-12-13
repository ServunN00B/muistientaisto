/// @description Fade out
if (image_alpha > 0) {
	image_alpha = image_alpha - 1 / fadeTime;
	alarm_set(0, 1);
} else { 
	alarm_set(1, 1);
}
