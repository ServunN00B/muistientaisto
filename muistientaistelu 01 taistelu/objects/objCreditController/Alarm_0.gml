/// @description ChickenLogo & Gamelogo
if (logo) {
	if (image_alpha > 0.05) {
		image_alpha -= 0.05;
		alarm_set(0,1);
	} else {
		sprite_index = sprTitle;
		image_alpha = 1;
		logo = false;
		self.x = x - sprite_width / 2;
		alarm_set(0, totalTime / textRows);
	}
} else {
	roller += 1;
	alarm_set(0, totalTime / textRows);
}
	
		
