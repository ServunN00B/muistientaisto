/// @description Fade in
if (image_alpha < 1) {
	image_alpha = image_alpha + 1 / fadeInTime;
	alarm_set(1, 1);
} else { 
	alarm_set(0, alarm_get(2) - fadeTime);
}
