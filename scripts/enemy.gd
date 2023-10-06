extends Area2D

@export var enemy_speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	global_position.x -= enemy_speed * delta

func die():
	queue_free()
