extends Node2D


export var speed=30
export var dividing =4.0
export var health=100
var max_health
var isDead=false
onready var startPosition = Vector2(get_viewport_rect().size.x*1.1,get_viewport_rect().size.y/dividing)
onready var animation=get_node("AnimatedSprite")
onready var gameManager=get_parent()
onready var anim_player = get_node("AnimationPlayer")
onready var collision_shape = get_node("Area2D/CollisionShape2D")
func _ready():
	animation.play("Run")
	max_health=health

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
	anim_player.play("Die")
	yield(get_tree().create_timer(1),"timeout")
	gameManager.add_kill()	
	reset()

func reset():
	visible=false
	speed*=1.1
	position = startPosition+Vector2(50,0);
	health = max_health
	visible=true
	animation.play("Run")
	isDead=false
	collision_shape.disabled=false;
	

func hit():
	health-=25	
	anim_player.play("Hit")
	$AudioStreamPlayer2D.playing = true
	animation.modulate.a = 0.5
	yield(get_tree().create_timer(0.3),"timeout")
	$AudioStreamPlayer2D.playing = false
	animation.modulate.a = 1
