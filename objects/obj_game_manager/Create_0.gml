var _seed = int64($"{current_day}{current_hour}{current_minute}{current_second}");
random_set_seed(_seed);

player = instance_nearest(x, y, obj_player);
text = "";

color = c_red;
color_accent = c_maroon;

money = 0;
dive_depth = 0;

loottable = [[obj_coin, 0.1], [obj_chest, 0.003], [obj_shark, 0.001], [obj_fish, 0.01]];

timer_seconds_start = 10;
timer_seconds = timer_seconds_start;
timer_ticks = game_get_speed(gamespeed_fps);

timer_ticks_message = 0

has_spawned_items = false;