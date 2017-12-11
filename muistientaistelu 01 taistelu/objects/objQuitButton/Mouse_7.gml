if (objTutorialHolder.sprite_index != sprEmpty || objTutorialHolder.recentlyviewed == true)
{
	//do nothing
}
else
{
	audio_play_sound(souButton, 1, false);
	audio_sound_gain(souButton, 1, 0);
	alarm[0] = room_speed/2;
	alarm[1] = room_speed;

}
