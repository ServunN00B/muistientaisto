/// @description Insert description here
// You can write your code in this editor
if (rollCreds) {
	if (origStart = 0) {
		self.x = self.x + stepSizeX;
		self.y = self.y - stepSizeY;
	} else {
		image_xscale -= stepScaleX;
		image_yscale -= stepScaleY;
		self.y = self.y + stepSizeY;
	}
}