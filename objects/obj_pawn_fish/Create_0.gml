event_inherited();

roam_x = 0;
roam_y = 0;

is_roaming = false;

function f_ai_move(_x_to, _y_to)
{
	direction = point_direction(x, y, _x_to, _y_to);
	
	if (x != _x_to) speed_x = lengthdir_x(speed_move, direction);
	if (y != _y_to) speed_y = lengthdir_y(speed_move, direction);
	
}

function f_ai_roam()
{
	var _x = irandom_range(32, room_width - 32);
	var _y = irandom_range(y - 100, y + 100);
	
	if (!is_roaming)
	{
		roam_x = _x;
		roam_y = clamp(_y, 170, room_height - 50);
		is_roaming = true;
	}
	else
	{
		f_ai_move(roam_x, roam_y);
		
		if collision_circle(roam_x, roam_y, 4, obj_pawn_fish, false, false)
		{
			is_roaming = false;
		}
	}
	
}