extends Node2D

var numOfKilled=0;
var score=0
var MAX_KILLS=10
onready var Audio=get_node("AudioStreamPlayer2D")


func _ready():
	Audio.play(Global.saved_music_position)
	get_node("Killed/RichTextLabel").text= "0/10"
	$Button.disabled=true

func add_kill():
	numOfKilled += 1
	get_node("Killed/RichTextLabel").text = str(numOfKilled)+"/10"
	if numOfKilled >= MAX_KILLS:
		next_level()

func next_level():
	$AudioStreamPlayer2D.queue_free()
	$Win.play()
	$Character.queue_free()
	$AlienRobot2.queue_free()
	$AlienRobot.queue_free()
	$AlienRobot3.queue_free()
	$Label.text="Level "+str(Global.get_level())+ " Complete!"
	Global.increase_level()
	$Label.visible=true;
	$Button.disabled=false;
	$Button.visible=true;
	CrazySDK.gameplayStop()


func _on_Button_pressed():
	CrazySDK.gameplayStart()
	get_tree().change_scene("res://Scenes/Level2.tscn")


func _on_Pause_pressed():
	get_tree().paused=true
	$Continue.disabled=false
	$Continue.visible=true
	CrazySDK.gameplayStop()


func _on_Continue_pressed():
	CrazySDK.gameplayStart()
	$Continue.disabled=true
	$Continue.visible=false
	get_tree().paused=false

