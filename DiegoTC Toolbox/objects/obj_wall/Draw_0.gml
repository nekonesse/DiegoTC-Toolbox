var grid_size = 32;

for(var i= 0; i < image_xscale; i++)
{
  for(var j = 0; j < image_yscale; j++)
  {
    draw_sprite_ext(sprite_index,image_index,x+(i*grid_size),y+(j*grid_size),1,1,image_angle,c_white,image_alpha);
  }
}