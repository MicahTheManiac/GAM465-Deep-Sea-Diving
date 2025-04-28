if (room == rm_game)
{
	// Oxygen
	draw_sprite_ext(spr_O2, 0, 20, 20, 2, 2, 0, c_white, 1);
	f_draw_text_font(90, 25, $"{timer_seconds}s", 2);
	
	// Depth
	f_draw_text_font(global.window_width / 2, 20, "Depth:", 1, c_ltgray, fa_top, fa_center);
	f_draw_text_font(global.window_width / 2, 40, $"{dive_depth}m", 2, c_white, fa_top, fa_center);
	
	// Coins
	draw_sprite_ext(spr_money, 0, global.window_width - 140, 20, 2, 2, 0, c_white, 1);
	f_draw_text_font(global.window_width - 130, 20, $"{money}", 2);
}

// Draw Message
if (timer_ticks_message > 0)
{
	timer_ticks_message -= 1;
	f_draw_text_font((global.window_width / 2) + 2, (global.window_height / 2) + 2, text, 2, color_accent, fa_middle, fa_center);
	f_draw_text_font((global.window_width / 2), (global.window_height / 2), text, 2, color, fa_middle, fa_center);
}