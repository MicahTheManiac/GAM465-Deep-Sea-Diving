// Tile
var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));

// Movement
if (y < 160)
{
	speed_y += speed_grav;
	speed_move = MOVE_SPEED;
}
// Calculate Collision
if (place_meeting(x + speed_x * 1.1, y, _tl_main))
{
	while (!place_meeting(x + sign(speed_x), y, _tl_main))
	{
		x += sign(speed_x);
	}
	speed_x = 0;
}
//	-	Block Collision on Top and Bottom
if (place_meeting(x, y + speed_y * 1.1, _tl_main))
{
	while (!place_meeting(x, y + sign(speed_y), _tl_main))
	{
		y += sign(speed_y);
	}
	speed_y = 0;
}

f_ai_roam();

// Apply Movement
x = clamp(x + speed_x, 0, room_width);
y = clamp(y + speed_y, 0, room_height);