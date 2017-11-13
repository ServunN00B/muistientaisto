/// @description Insert description here
// You can write your code in this editor
if(string_length(keyboard_string)<nameLimit) {
	if (!keyboard_check_pressed(vk_enter)){
	nameField = keyboard_string;
	}
} else {
	keyboard_string = nameField;
}