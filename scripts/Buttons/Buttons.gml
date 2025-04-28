// Buttons Test
function f_button_test()
{
	show_debug_message(" > Button Working");
}

// Get Text for Weight Upgrade
function f_button_weight_text()
{
	var _weight = -1;
	var _cost = global.cost_weight;
	
	if (instance_exists(obj_player))
	{
		_weight = obj_player.weight * 100;
	}
	
	return $"Weight\nCurrent: {_weight}kg\nUpgrade: ${_cost}";
}

// Get Text for Ascent Upgrade
function f_button_ascent_text()
{
	var _speed = -1;
	var _cost = global.cost_ascent;
	
	if (instance_exists(obj_player))
	{
		_speed = obj_player.speed_ascend * 100;
	}
	
	return $"Ascend Speed\nCurrent: {_speed}%\nUpgrade: ${_cost}";
}

// Get Text for Exchange Rate Upgrade
function f_button_exchange_text()
{
	var _rate = global.rate_exchange * 100;
	var _cost = global.cost_exchange;
	
	return $"Exchange Rate\nCurrent: {_rate}%\nUpgrade: ${_cost}";
}

// Purchase Weight
function f_button_weight_buy()
{
	// Check if we have Enough Money
	if (obj_game_manager.money >= global.cost_weight)
	{
		// Offset Cost and Increase Price
		obj_game_manager.money -= global.cost_weight;
		global.cost_weight += int64(global.cost_weight * 0.4);
		
		// Set our Player's Weight
		if (instance_exists(obj_player))
		{
			obj_player.weight += 0.25;
		}
	}
	else
	{
		// We dont have enough
		f_show_message("Not Enough Money!", 2, false);
	}
	
	// Update Button Text
	text = f_button_weight_text();
}

// Purchase Ascent
function f_button_ascent_buy()
{
	// Check if we have Enough Money
	if (obj_game_manager.money >= global.cost_ascent)
	{
		// Offset Cost and Increase Price
		obj_game_manager.money -= global.cost_ascent;
		global.cost_ascent += int64(global.cost_ascent * 0.4) + 5;
		
		// Set our Player's Weight
		if (instance_exists(obj_player))
		{
			obj_player.speed_ascend += 0.5;
		}
	}
	else
	{
		// We dont have enough
		f_show_message("Not Enough Money!", 2, false);
	}
	
	// Update Button Text
	text = f_button_ascent_text();
}

// Purchase Exchange
function f_button_exchange_buy()
{
	// Check if we have Enough Money
	if (obj_game_manager.money >= global.cost_exchange)
	{
		// Offset Cost and Increase Price
		obj_game_manager.money -= global.cost_exchange;
		global.cost_exchange += int64(global.cost_exchange * 2) + 100;
		
		global.rate_exchange += 0.5;
	}
	else
	{
		// We dont have enough
		f_show_message("Not Enough Money!", 2, false);
	}
	
	// Update Button Text
	text = f_button_exchange_text();
}

// Show Credits
function f_show_credits()
{
	// Hide GUI
	instance_deactivate_layer("InstancesGUI");
	
	// Show Credits
	instance_activate_layer("InstancesCredits");
}

// Hide Credits
function f_hide_credits()
{
	// Show GUI
	instance_activate_layer("InstancesGUI");
	
	// Show Credits
	instance_deactivate_layer("InstancesCredits");
}