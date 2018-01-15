/// @description Insert description here
// You can write your code in this editor

if (i > 4)
{
	sprite_index = sprEmpty;
	i = 0;
	recentlyviewed = true;
	alarm[0] = 1 * room_speed;
}
else 
{
	sprite_index = TutorialSprites[i];
	i++;
}
