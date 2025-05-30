extends Control



func _on_Play_Again_pressed():
	var scene="res://Scenes/Level"+str(Global.get_level())+".tscn"
	$AudioStreamPlayer.playing = false
	CrazySDK.midgameAd()
	CrazySDK.gameplayStart()
	get_tree().change_scene(scene)


func _on_Result_tree_entered():
	CrazySDK.gameplayStop()
	$AudioStreamPlayer.playing = true
	yield(get_tree().create_timer(1.1),"timeout")
	$AudioStreamPlayer.playing = false
