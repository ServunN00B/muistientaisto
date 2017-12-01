/// @description Insert description here
// You can write your code in this editor
var MyId = self.id;
image_xscale = image_xscale * 1.5;
image_yscale = image_yscale * 1.5;
self.x -= sprite_width / 2;
with(instance_create_depth(self.x + sprite_width, self.y, depth - 1, objRejectButton)) {
	objToDestroy = MyId;
}