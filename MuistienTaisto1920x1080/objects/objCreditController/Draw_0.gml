/// @description Insert description here
// You can write your code in this editor
draw_self();
if (!logo) {
	for (var i = 0; i < textRows; i+=1) {
		if (sprite_height + (20 * i) - (20 * roller) + 500 > sprite_height + 20) {
			if (sprite_height + (20 * i) - (20 * roller) + 500 < room_height) {
				draw_text(self.x , sprite_height + (20 * i) - (20 * roller) + 500, ds_list_find_value(creds, i));
			}
		}
	}
}