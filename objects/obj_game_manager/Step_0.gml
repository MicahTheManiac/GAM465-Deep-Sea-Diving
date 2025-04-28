player = instance_nearest(x, y, obj_player);

if (room == rm_game)
{
	// Dive Depth
	dive_depth = (player.y - 160) div 32;
	
	// If our Player is in Water
	if (player.y > 160)
	{
		timer_ticks -= 1;
		
		// Decrease Seconds and Reset
		if (timer_ticks <= 0)
		{
			timer_seconds -= 1;
			timer_ticks = game_get_speed(gamespeed_fps);
		}
		
		// Reset Game
		if (timer_seconds <= 0)
		{
			player.x = xstart;
			player.y = ystart;
			
			timer_seconds = timer_seconds_start;
			layer_destroy_instances("Instances");
		}
		
		// Create Loot
		if (!has_spawned_items)
		{
			var _width = floor(room_width / 16) - 1;
			var _height = floor(room_height / 16) - 3;
			
			for (var _i = 1; _i < _width; _i++)
			{
				for (var _j = 12; _j < _height; _j++)
				{
					var _index = irandom_range(0, array_length(loottable) - 1);
					
					if (f_chance(loottable[_index][1]))
					{
						instance_create_layer(_i * 16, _j * 16, "Instances", loottable[_index][0]);
					}
				}
			}
			
			has_spawned_items = true;
		}
		
		// Deactivate GUI
		instance_deactivate_layer("InstancesGUI");
	}
	else
	{
		has_spawned_items = false;
		layer_destroy_instances("Instances");
		instance_activate_layer("InstancesGUI");
	}
}

// Mouse Click
	if (mouse_check_button_pressed(mb_left))
	{
		// Make Bubbles
		if (mouse_y > 170) or (room == rm_title)
		{
			instance_create_layer(mouse_x, mouse_y, "InstancesGUI", obj_bubbles);
		}
		
		// Attract Fish
		var _fish = collision_circle(mouse_x, mouse_y, 64, obj_pawn_fish, false, true);
		if (_fish)
		{
			_fish.roam_x = mouse_x;
			_fish.roam_y = clamp(mouse_y, 170, room_height - 50);
		}
	}