/// @description Card resize
BigScale = OrigScale * scaleChange;
scaleStep = ((BigScale - OrigScale) / scaleTime) * 2;
cordXChange = (origWidth * scaleChange - origWidth) / 2; // Divider can be changed
cordYChange = (origHeight * scaleChange - origHeight) / 2;
cordXStep = cordXChange / scaleTime;
cordYStep = cordYChange / scaleTime;
var nowScale = self.image_xscale;
if (scaling) {
	if (BigScale > nowScale) {
		self.image_xscale = self.image_xscale + scaleStep;
		self.image_yscale = self.image_yscale + scaleStep;
		//Easter egg card chase mode
		//self.x = self.x - (sprite_width - origWidth) / 2;
		//self.y = self.y - (sprite_height - origHeight) / 2;
		self.x = self.x - cordXStep;
		self.y = self.y - cordYStep;
		depth -= 5;
		alarm_set(4,1)
	} else {
		scaling = false;
		alarm_set(4,1)
	}
} else {
	if (nowScale>OrigScale) {
		self.image_xscale = self.image_xscale - scaleStep;
		self.image_yscale = self.image_yscale - scaleStep;
		//Easter egg card chase mode
		//self.x = self.x + (sprite_width - origWidth) / 2;
		//self.y = self.y + (sprite_height - origHeight) / 2;
		self.x = self.x + cordXStep;
		self.y = self.y + cordYStep;
		
		depth += 5;
		alarm_set(4,1)
	}
}
		