/// @description Insert description here
// You can write your code in this editor
var MyId = self.id;
image_xscale = image_xscale * 1.5;
image_yscale = image_yscale * 1.5;
self.x -= sprite_width / 2;
var arrowL;
var arrowR;
basicValue = objPerSave.aiDifficulty;
aiDifficultyName = "";

//Creating arrow left
with(instance_create_depth(self.x + sprite_width / 2 - 50, self.y + 140, depth - 1, objArrowButton)) {
	moreless = "less";
	targetObj = "objPerSave";
	targetVar = "aiDifficulty";
	sprite_index = sprArrowButton;
	image_xscale = image_xscale * -1;
	arrowL = self.id;
}

//Creating arrow right
with(instance_create_depth(self.x + sprite_width / 2 + 50, self.y + 140, depth - 1, objArrowButton)) {
	moreless = "more";
	targetObj = "objPerSave";
	targetVar = "aiDifficulty";
	sprite_index = sprArrowButton;
	arrowR = self.id;
}

//Creating close button
with(instance_create_depth(self.x + sprite_width, self.y, depth - 1, objRejectButton)) {
	objToDestroy = [ MyId, arrowL, arrowR];
}

switch(basicValue) {
	case 0:
		aiDifficultyName = "Easy";
	break;
		
	case 1:
		aiDifficultyName = "Normal";
	break;
		
	case 2:
		aiDifficultyName = "Hard";
	break;
		
	case 3:
		aiDifficultyName = "Adaptive";
	break;
}