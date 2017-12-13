/// @description Insert description here
// You can write your code in this editor
draw_self();
if (!logo) {
	for (var i = 0; i < textRows; i+=1) {
		if (self.y + sprite_height + 20 + (20 * i)  - (20 * roller) > self.y + sprite_height + 20) {
			if (self.y + sprite_height + 20 + (20 * i)  - (20 * roller) < room_height) {
				draw_text(self.x , sprite_height + 20 + (20 * i) - (20 * roller), ds_list_find_value(creds, i));
			}
		}
	}
}