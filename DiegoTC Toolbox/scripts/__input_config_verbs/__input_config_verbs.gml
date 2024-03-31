// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

return {
    
     keyboard_and_mouse:
    {
        up:    input_binding_key(vk_up),
        down:  input_binding_key(vk_down),
        left:  input_binding_key(vk_left),
        right: input_binding_key(vk_right),

        jump:  input_binding_key("X"),
        carry:  input_binding_key("Z"),
        action: input_binding_key("C"),
		record: input_binding_key("A"),
		recordplay: input_binding_key("S"),
		
		restart: input_binding_key("R"),
		
		accept:  input_binding_key("X"),
        cancel:  input_binding_key("Z"),
        
        pause: input_binding_key(vk_escape),
    },
    
    gamepad:
    {
        up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
        down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
        left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
        right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
		
		jump:  input_binding_gamepad_button(gp_face1),
        carry:  [input_binding_gamepad_button(gp_shoulderlb), input_binding_gamepad_button(gp_shoulderrb)],
        action: input_binding_gamepad_button(gp_face2),
		record: input_binding_gamepad_button(gp_shoulderl),
		recordplay: input_binding_gamepad_button(gp_shoulderr),
		
		restart: input_binding_gamepad_button(gp_face3),
		
		accept: input_binding_gamepad_button(gp_face1),
		cancel: input_binding_gamepad_button(gp_face2),
        
        pause: input_binding_gamepad_button(gp_start),
    },
    
    touch:
    {
        up:    input_binding_virtual_button(),
        down:  input_binding_virtual_button(),
        left:  input_binding_virtual_button(),
        right: input_binding_virtual_button(),
        
        accept:  input_binding_virtual_button(),
        cancel:  input_binding_virtual_button(),
        action:  input_binding_virtual_button(),
        special: input_binding_virtual_button(),
        
        pause: input_binding_virtual_button(),
    }
    
};
