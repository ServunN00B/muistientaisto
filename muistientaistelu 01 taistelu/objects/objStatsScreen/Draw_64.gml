/// @description Insert description here
// You can write your code in this editor
var osa = sprite_width / 3;
var NimiL = string_width(objPerSave.playerName);
draw_text_transformed(self.x + sprite_width / 2 - NimiL / 2, self.y + 30, objPerSave.playerName, 1.5,1.5,0);
NimiL = string_width("Basic Stats");
draw_text(self.x + sprite_width / 2 - NimiL / 2, self.y + 50, "Basic Stats");
draw_text(self.x + osa, self.y + 70, "Wins");
draw_text(self.x + osa, self.y + 90, "Lose");
draw_text(self.x + osa, self.y + 110, "Total");

draw_text(self.x + sprite_width / 2, self.y + 70, objPerSave.playerWins);
draw_text(self.x + sprite_width / 2, self.y + 90, objPerSave.playerLose);
draw_text(self.x + sprite_width / 2, self.y + 110, objPerSave.playerTotal);
