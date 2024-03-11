selected=wrap_val(selected,0,array_length(menus)-1)

if input_check_pressed("up")
selected-=1;
else if input_check_pressed("down")
selected+=1;

if input_check_pressed("jump")
TransitionStart(targets[selected],sqRoomFadeOut,sqRoomFadeIn)