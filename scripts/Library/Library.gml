#macro ROOM_START rm_title
#macro GRAVITY_SPEED 0.25
#macro MOVE_SPEED 4

#macro FONT_HEIGHT 27
#macro FONT_WIDTH 21

// Globals
global.window_width = 0;
global.window_height = 0;

global.rate_exchange = 1;

global.cost_weight = 25;
global.cost_ascent = 50;
global.cost_exchange = 100;

// Font Func
function f_draw_text_font(x, y, _text, _size = 1, _color = c_white, _valign = fa_top, _halign = fa_left, _font = fnt_silver){
	// Set Values
	draw_set_font(_font);
	draw_set_color(_color);
	draw_set_valign(_valign);
	draw_set_halign(_halign);
	// World Size Value is .167
	
	// Draw Text
	draw_text_transformed_color(x, y, _text, _size, _size, 0, _color, _color, _color, _color, 1);
	
	// Reset Font
	draw_set_font(fnt_silver);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
}

// Wave Function
function f_wave(_to, _from, _duration, _offset)
{
	var _value = (_to - _from) * 0.5;
	return _from + _value + sin(((current_time * 0.001) + _duration * _offset) / _duration * (pi * 2)) * _value;
}

// Chance Function
function f_chance(_chance_percent)
{
	return _chance_percent > random(1);
}

// Draw a Message to Screen
function f_show_message(_text, _t_sec = 2, _is_warning = true)
{
	if (instance_exists(obj_game_manager))
	{
		with (obj_game_manager)
		{
			text = _text;
			timer_ticks_message = game_get_speed(gamespeed_fps) * _t_sec;
			if (_is_warning)
			{
				color = c_red;
				color_accent = c_maroon;
			}
			else
			{
				color = c_white;
				color_accent = c_gray;
			}
		}
	}
}