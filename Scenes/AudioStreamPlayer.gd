extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)  # We don't need processing
	if not playing:
		play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
