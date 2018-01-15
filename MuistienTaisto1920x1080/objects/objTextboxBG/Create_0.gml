/// @description Insert description here
// You can write your code in this editor
depth = depth - 5;
self.image_yscale = 0.2;
with(instance_create_depth(0,0,self.depth+2, objBlock)) {
	sprite_index = sprScreenFade;
}
instance_create_depth(self.x,self.y + (self.sprite_height-34),self.depth-5, objTextboxWall);
with(instance_create_depth(self.x + sprite_width,self.y+34,self.depth-5, objTextboxWall)){
	image_angle = 180;
}
instance_create_depth(self.x+(sprite_width/2-120),self.y + (self.sprite_height/2),self.depth-5, objTextboxText);
instance_create_depth(self.x+(sprite_width/2),self.y + self.sprite_height,self.depth-6, objTextOk);