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


// Do Splash when Entering Water
if (y >= 160) and (!has_done_sound)
{
	var _pitch = choose(0.8, 1.0, 1.2)
	audio_play_sound(snd_splash, 1, 0, 1, 0.2, _pitch);
	has_done_sound = true;
}
else if (y < 160)
{
	has_done_sound = false;
}