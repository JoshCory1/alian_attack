extends Area2D

@export var rocket_speed = 500

func  _physics_process(delta):
#	global_position = global_position + rocket_speed
	global_position.x += rocket_speed * delta

