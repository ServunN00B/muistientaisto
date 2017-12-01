/// @description Name check
// Checking if savegames exist
scrSavegame(0,nameField);
objPerSave.playerName = nameField;
instance_destroy(objBlock);
instance_destroy(objTextboxBG);
instance_destroy(objTextboxWall);
instance_destroy(objTextboxText);
instance_destroy(objTextOk);
if (objPerSave.debugMod) {
	show_debug_message(string(objPerSave.playerName));
}