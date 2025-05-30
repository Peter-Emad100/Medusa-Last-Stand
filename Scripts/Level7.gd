extends Node2D

var numOfKilled=0;
var score=0
var MAX_KILLS=20
func _ready():
	get_node("Killed/RichTextLabel").text= "0/20"
	$Button.disabled=true
	if CrazySDK.hasSDK():
		CrazySDK.connect("ad_started", self, "adStarted")
		CrazySDK.connect("ad_finished", self, "adFinished")
		CrazySDK.connect("ad_error", self, "adError")
		CrazySDK.connect("adblock_result", self, "adblockResult")

func add_kill():
	numOfKilled += 1
	get_node("Killed/RichTextLabel").text = str(numOfKilled)+"/20"
	if numOfKilled >= MAX_KILLS:
		next_level()

func next_level():
	$AudioStreamPlayer2D.queue_free()
	$Win.play()
	$Character.queue_free()
	$Robot3.queue_free()
	$Robot4.queue_free()
	$AirCraft.queue_free()
	$AirCraft2.queue_free()
	$AirCraft3.queue_free()
	$Label.text="Level "+str(Global.get_level())+ " Complete!"
	Global.increase_level()
	$Label.visible=true;
	$Button.disabled=false;
	$Button.visible=true;
	CrazySDK.gameplayStop()


func _on_Button_pressed():
	$Win.playing=false
	CrazySDK.midgameAd()
	CrazySDK.gameplayStart()
	get_tree().change_scene("res://Scenes/Level8.tscn")


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
