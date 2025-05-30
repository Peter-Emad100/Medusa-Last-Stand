extends Node2D

onready var animatedSprite=get_node("AnimatedSprite")
var bulletScene=preload("res://Scenes/Bullet.tscn")
onready var bulletPosition=get_node("BulletPosition")
var score=0 

func _ready():
	animatedSprite.play("Fly")
	$Wrong.stream.loop = false

func _unhandled_input(event):
	var screen_width = get_viewport_rect().size.x
	var mousePos = get_global_mouse_position()
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if not $ShootTimer.is_stopped():  # Check if the cooldown is active
			return  # Prevent shooting too fast
		if mousePos.x < (screen_width / 2) + (0.02 * screen_width):
			$ShootTimer.start()
			Shoot()
		else:
			$Wrong.playing = true
			
func _on_AnimatedSprite_animation_finished():
	animatedSprite.play("Fly")



func Shoot():
	animatedSprite.play("Shoot")	
	var bullet=bulletScene.instance()
	bullet.position=bulletPosition.get_global_position()
	get_parent().add_child(bullet)
