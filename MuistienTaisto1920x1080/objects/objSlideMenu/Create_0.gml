/// @description Insert description here
// You can write your code in this editor
xmoved = x;
xorig = x;
yorig = y;
depth = -666;
var scaleButtons = 0.6;
var buttonHeight;
menuButtonId = noone;
with(instance_create_depth(self.x + 40, self.y + 30, depth - 1, objMenuButton)) {
	objSlideMenu.menuButtonId = self.id;
	image_xscale = image_xscale * scaleButtons + 0.2;
	image_yscale = image_yscale * scaleButtons + 0.2;
	buttonHeight = image_yscale;
}
musicButtonId = noone;
with(instance_create_depth(self.x + 40, self.y + buttonHeight + 100, depth - 1, objMusic)) {
	objSlideMenu.musicButtonId = self.id;
	image_xscale = image_xscale * scaleButtons;
	image_yscale = image_yscale * scaleButtons;
	buttonHeight += image_yscale;
}
soundButtonId = noone;
with(instance_create_depth(self.x + 40, self.y + buttonHeight + 225, depth - 1, objSound)) {
	objSlideMenu.soundButtonId = self.id;
	image_xscale = image_xscale * scaleButtons;
	image_yscale = image_yscale * scaleButtons;
}