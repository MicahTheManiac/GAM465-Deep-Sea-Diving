with(obj_game_manager)
{
	money += int64(other.money * global.rate_exchange);
}

var _pitch = choose(1.0, 1.2)
audio_play_sound(snd_pop, 1, 0, 0.75, 0, _pitch);
instance_destroy(id);