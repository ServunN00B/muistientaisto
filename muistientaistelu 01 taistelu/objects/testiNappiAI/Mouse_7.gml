/// @description Insert description here
// You can write your code in this editor
if (objTutorialHolder.sprite_index != sprEmpty || objTutorialHolder.recentlyviewed == true)
{
	//do nothing
}
else
{
	objPerSave.AI = true;
	room_goto(1);
}
