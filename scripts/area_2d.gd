extends Area2D

@export var rocket_speed = 500
@onready var visble_notifier = $VisibleNotifier

func _ready():
	visble_notifier.connect("screen_exited", _on_screen_exited)

func  _physics_process(delta):
#	global_position = global_position + rocket_speed
	global_position.x += rocket_speed * delta


func _on_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
	area.die()
	
