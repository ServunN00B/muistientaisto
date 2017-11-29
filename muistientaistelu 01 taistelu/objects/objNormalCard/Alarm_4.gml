/// @description Card resize
BigScale = OrigScale * scaleChange;
scaleStep = ((BigScale - OrigScale) / scaleTime) * 2;
var nowScale = image_xscale;
if (scaling) {
	if (BigScale > nowScale) {
		image_xscale = image_xscale + scaleStep;
		image_yscale = image_yscale + scaleStep;
		alarm_set(4,1)
	} else {
		if (objPerSave.debugMod) {
			show_message(string(nowScale / OrigScale));
		}
		scaling = false;
		alarm_set(4,1)
	}
} else {
	if (nowScale>OrigScale) {
		image_xscale = image_xscale - scaleStep;
		image_yscale = image_yscale - scaleStep;
		alarm_set(4,1)
	}
}
		