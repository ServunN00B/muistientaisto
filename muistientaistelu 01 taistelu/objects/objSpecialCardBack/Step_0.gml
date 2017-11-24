/// @description Insert description here
// You can write your code in this editor
if(!select) {
	if(mouseOver) {
		if(!point_in_rectangle(mouse_x,mouse_y, self.x, self.y, self.x + sprite_width, self.y + sprite_height + 150)) {
			y = orig_ypos;
			variable_instance_set(spCardFront,"y",orig_ypos);
			mouseOver = false;
		}
	} else {
		if(point_in_rectangle(mouse_x,mouse_y, self.x, self.y, self.x + sprite_width, self.y + sprite_height)) {
			y = y-150;
			variable_instance_set(spCardFront,"y",self.y);
			mouseOver = true;
		}
	}
}