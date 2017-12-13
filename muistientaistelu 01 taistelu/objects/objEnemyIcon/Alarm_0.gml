/// @description Insert description here
// You can write your code in this editor

with(instance_create_depth(self.x - sprite_width / 2 - 100, 660, -13, objCoin)) {
	image_xscale = 0.20;
	image_yscale = 0.20;
	playerCoin = true;
	playerNum = 2;
	value = objPerSave.p2Coin;
}