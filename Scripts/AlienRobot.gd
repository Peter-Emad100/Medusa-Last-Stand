extends Node2D
onready var gameManager=get_parent()

export var speed=50
var health=100
var isDead=false
onready var startPosition = Vector2(get_viewport_rect().size.x,get_viewport_rect().size.y)
onready var animation=get_node("AnimatedSprite")
onready var collision_shape = get_node("Area2D/CollisionShape2D")
func _ready():
	animation.play("Run")


func _process(delta):
	if not isDead:
		translate(Vector2(-speed*delta,0))
	if health<=0:
		if isDead: return
		die()
		
	if position.x<=39:
		get_tree().change_scene("res://Scenes/ResultScene.tscn")

func die():
	isDead=true
	collision_shape.disabled=true;
	get_node("Damage taken").visible = false
	animation.play("Die")
	$AnimationPlayer.play("Die")
	yield(get_tree().create_timer(1),"timeout")	
	gameManager.add_kill()
	reset()

func reset():
	visible=false
	speed*=1.1
	position = startPosition
	health = 100
	visible=true
	animation.play("Run")
	isDead=false
	collision_shape.disabled=false;
	
	

func hit():
	health-=25	
	$AnimationPlayer.play("Hit")
	$AudioStreamPlayer2D.playing = true
	animation.modulate.a = 0.5
	yield(get_tree().create_timer(0.3),"timeout")
	$AudioStreamPlayer2D.playing = false
	animation.modulate.a = 1
	

