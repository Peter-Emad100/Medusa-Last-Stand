extends Node

var player_level = 1  # Default level is 1
var saved_music_position = 0.0
func increase_level():
	player_level += 1

func reset_level():
	player_level = 1

func get_level():
	return player_level
