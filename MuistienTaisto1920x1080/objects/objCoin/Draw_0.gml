/// @description Insert description here
// You can write your code in this editor
draw_self();
if(playerCoin) {
	if(playerNum = 1) {
		value = objPerSave.p1Coin;
	} else {
		value = objPerSave.p2Coin;
	}
}
var blop = string(value);
var diffy = sprite_height / string_height(blop);
var diffx = sprite_width / string_width(blop);
draw_text_transformed(self.x + sprite_width / 3 ,self.y + sprite_height / 4, blop, diffx/3, diffy/2,0);