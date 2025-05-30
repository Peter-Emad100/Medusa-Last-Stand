extends Control

func _on_Button_pressed():
	Global.saved_music_position = $AudioStreamPlayer.get_playback_position()
	get_tree().change_scene("res://Scenes/Guide.tscn")
