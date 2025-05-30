extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Audio=get_node("AudioStreamPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.play(Global.saved_music_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	CrazySDK.gameplayStart()
	Global.saved_music_position = $AudioStreamPlayer.get_playback_position()
	get_tree().change_scene("res://Scenes/Level1.tscn")
