/// @description Card resize
var nowScale = self.image_xscale;
/*
if (scaling) {
	if (BigScale > nowScale) {
		self.image_xscale = nowScale + scaleStep;
		self.image_yscale = nowScale + scaleStep;
		//Easter egg card chase mode
		//self.x = self.x - (sprite_width - origWidth) / 2;
		//self.y = self.y - (sprite_height - origHeight) / 2;
		self.x = self.x - cordXStep;
		self.y = self.y - cordYStep;
		depth -= 5;
		self.manySteps += 1;
		alarm_set(4,1)
	} else {
		scaling = false;
		alarm_set(4,1)
	}
} else {
	if (manySteps > 0) {
		self.image_xscale = nowScale - scaleStep;
		self.image_yscale = nowScale - scaleStep;
		//Easter egg card chase mode
		//self.x = self.x + (sprite_width - origWidth) / 2;
		//self.y = self.y + (sprite_height - origHeight) / 2;
		self.x = self.x + cordXStep;
		self.y = self.y + cordYStep;
		self.manySteps -= 1;		
		depth += 5;
		alarm_set(4,1)
	}
}
	*/	