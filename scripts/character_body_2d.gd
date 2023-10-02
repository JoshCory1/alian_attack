extends CharacterBody2D

var force=Vector2(0, 0)
var rocket_scene = preload("res://prefabs/area_2d.tscn")
@export var speed=300





func _process(delta):
	if Input.is_action_just_pressed("fire"):
		shoot()
	

func _physics_process(delta):
	
	if Input.is_action_pressed("move_right"):
		force=Vector2(speed, 0)
	elif Input.is_action_pressed("move_left"):
		force = Vector2(-speed, 0)
	elif Input.is_action_pressed("move_up"):
		force = Vector2(0, -speed)
	elif Input.is_action_pressed("move_down"):
		force = Vector2(0, speed)
	else:
		force = Vector2(0, 0)
	velocity = force
	move_and_slide()
	var screesize = get_viewport_rect().size
#	if global_position.x < 0:
#		global_position.x = 0
#	if global_position.x > screesize.x:
#		global_position.x = screesize.x
#	if global_position.y < 0:
#		global_position.y = 0
#	if global_position.y > screesize.y:
#		global_position.y = screesize.y

#	global_position.x = clampf(global_position.x, 0, screesize.x)
#	global_position.y = clampf(global_position.y, 0, screesize.y)

	global_position = global_position.clamp(Vector2(0,0), screesize)
		
#	print(global_position)

func  shoot():
	
	var rocket_instance = rocket_scene.instantiate()
	add_child(rocket_instance)
	rocket_instance.global_position.x += 80
