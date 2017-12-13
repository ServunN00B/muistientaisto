/// @description Pic change
if(origStart = 0) {
	sprite_index =  sprNight;
	origStart = self.y;
} else {
	room_goto(rooMain);
}

alarm_set(2, onePicTime);