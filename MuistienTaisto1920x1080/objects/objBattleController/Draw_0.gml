/// @description Insert description here
// You can write your code in this editor
p1 = objPerSave.p1Health/objPerSave.p1StartHealth;
p2 = objPerSave.p2Health/objPerSave.p2StartHealth;

objPL1Healthbar.image_xscale = p1*pl1Hbar;
objPL2Healthbar.image_xscale = p2*pl2Hbar;

draw_text(objPL1HP.x, objPL1HP.y, string(objPerSave.p1Health));

draw_text(objPL2HP.x, objPL2HP.y, string(objPerSave.p2Health));

if (shake = true) {
	if (damageDone > 0)
	{
		draw_text_transformed_color(objParticle.x,objParticle.y - 200, string(damageDone),5,6,0,c_red,c_red,c_red,c_red,100);
	}
	else
	{
		draw_text_transformed_color(objParticle.x,objParticle.y - 200, "0" ,5,6,0,c_red,c_red,c_red,c_red,100);
	}
}