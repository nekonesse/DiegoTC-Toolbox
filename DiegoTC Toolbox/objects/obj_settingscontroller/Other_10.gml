/// @description Do Keybinding Shit
input_binding_scan_abort();

input_binding_scan_start(function(_binding)
{
	input_binding_set(rebinding_verb, _binding);
	rebinding_verb="";
});