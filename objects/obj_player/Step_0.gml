event_inherited();

// Input
var _key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _key_right =keyboard_check(vk_right) or  keyboard_check(ord("D"));
var _key_up = keyboard_check(vk_space) or keyboard_check(vk_up) or keyboard_check(ord("W"));

// Calculate Movement
var _move_x = _key_right - _key_left;
speed_x = _move_x * speed_move;

// Check if we are on ground before Jump
if (is_on_ground) and (_key_up)
{
	speed_y = -4.5;
}
else if (!is_on_ground) and (y > 200) and (_key_up)
{
	speed_y = -speed_ascend;
}


// Death
if (health_current <= 0) and (!is_dead)
{
	is_dead = true;
	deaths += 1;
}

if (is_dead)
{
	// Prevent Movement
	speed_x = 0;
	speed_y = 0;
}