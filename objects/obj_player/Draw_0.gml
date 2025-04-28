//mask_index = spr_player_idle;
draw_self();

if (speed_x = 0) sprite_index = spr_player_idle;
image_xscale = 1;

if (speed_x != 0) and (y <= 160)
{
	sprite_index = spr_player_walk;
	
	if (speed_x < 0)
	{
		image_xscale = -1;
	}
}
else if (y > 170)
{
	sprite_index = spr_player_dive;
}