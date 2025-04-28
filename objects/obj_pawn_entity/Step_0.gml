// Tile
var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));


// Calculate Gravity
if (y < 160)
{
	speed_y += speed_grav;
	speed_move = MOVE_SPEED;
}
else
{
	speed_y = clamp(speed_y + 0.1, -10, 1 * weight);
	speed_move = clamp(0.5 + (weight / 2), 0, MOVE_SPEED);
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
	
	// Checking if going down (+)
	if (speed_y > 0)
	{
		speed_y = 0;
		is_on_ground = true;
	}
	else
	{
		speed_y = 0;
	}
}
else
{
	is_on_ground = false;
}

// Entity Collision
if (do_entity_collision) and (place_meeting(x + speed_x * 1.1, y, obj_pawn_entity))
{
	while (!place_meeting(x + sign(speed_x), y, obj_pawn_entity))
	{
		x += sign(speed_x);
	}
	speed_x = 0;
}

//	-	Allows clipping through underneath entities
if (do_entity_collision) and (place_meeting(x, y + speed_y, obj_pawn_entity)) and (speed_y > 0)
{
	while (!place_meeting(x, y + sign(speed_y), obj_pawn_entity))
	{
		y += sign(speed_y);
	}
	speed_y = 0;
	is_on_ground = true;
}

// Apply Movement
x = clamp(x + speed_x, 0, room_width);
y = clamp(y + speed_y, 0, room_height);