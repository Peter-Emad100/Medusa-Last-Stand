extends Node2D

var bulletSpeed=400

func _ready():	
	var mousePos=get_global_mouse_position()
	look_at(mousePos)



func _process(delta):
	position += transform.x*delta*bulletSpeed
	if get_position()==Vector2(get_viewport_rect().size.x,get_viewport_rect().size.y):
		queue_free()


func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group("Aliens"):
		area.get_parent().hit()
		queue_free()
	if area.get_parent().is_in_group("AirCrafts"):
		area.get_parent().hit()
		queue_free()


