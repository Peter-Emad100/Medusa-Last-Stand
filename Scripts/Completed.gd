extends Control

func _on_Button_pressed():
	CrazySDK.gameplayStart()
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_Completed_tree_entered():
	CrazySDK.gameplayStop()
