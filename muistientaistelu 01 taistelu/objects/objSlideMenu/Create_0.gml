/// @description Insert description here
// You can write your code in this editor
xmoved = x;
xorig = x;
yorig = y;
var scaleButtons = 0.5;
menuButtonId = noone;
with(instance_create_depth(self.x + 40, self.y + 30, depth - 1, objMenuButton)) {
	objSlideMenu.menuButtonId = self.id;
	image_xscale = image_xscale * scaleButtons;
	image_yscale = image_yscale * scaleButtons;
}
musicButtonId = noone;
with(instance_create_depth(self.x + 40, self.y + 100, depth - 1, objMusic)) {
	objSlideMenu.musicButtonId = self.id;
	image_xscale = image_xscale * 0.3;
	image_yscale = image_yscale * 0.3;
}
soundButtonId = noone;
with(instance_create_depth(self.x + 40, self.y + 170, depth - 1, objSound)) {
	objSlideMenu.soundButtonId = self.id;
	image_xscale = image_xscale * 0.3;
	image_yscale = image_yscale * 0.3;
}