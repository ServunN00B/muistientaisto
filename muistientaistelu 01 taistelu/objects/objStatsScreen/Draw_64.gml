/// @description Insert description here
// You can write your code in this editor
var osa = sprite_width / 3;
var NimiL = string_width(objPerSave.playerName);
draw_text_transformed(self.x + sprite_width / 2 - NimiL / 2, self.y + 30, objPerSave.playerName, 1.5,1.5,0);

draw_text(self.x + osa, self.y + 50, "Wins");
draw_text(self.x + osa, self.y + 70, "Lose");
draw_text(self.x + osa, self.y + 90, "Total");

draw_text(self.x + sprite_width / 2, self.y + 50, objPerSave.playerWins);
draw_text(self.x + sprite_width / 2, self.y + 70, objPerSave.playerLose);
draw_text(self.x + sprite_width / 2, self.y + 90, objPerSave.playerTotal);

NimiL = string_width("AI Difficulty");
draw_text(self.x + sprite_width / 2 - NimiL / 2, self.y + 120, "AI Difficulty");
NimiL = string_width(aiDifficultyName);
draw_text(self.x + sprite_width / 2 - NimiL / 2, self.y + 150, aiDifficultyName);
