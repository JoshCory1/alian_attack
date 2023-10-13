extends Node2D

var enemy_scene = preload("res://prefabs/enemy.tscn")
signal enemy_spwaned(enemy_instance)
@onready var spawn_position = $SpawnPositions
@onready var time = $Timer
@export var time_Reduce = 1.2

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawn_child = spawn_position.get_children()
	var random_spawn_posistion = spawn_child.pick_random()
	var enemy_instance = enemy_scene.instantiate()
#	spawn_position.add_child(enemy_instance)
	enemy_instance.global_position = random_spawn_posistion.global_position
	emit_signal("enemy_spwaned", enemy_instance)




func _on_timer_2_timeout():
	if time.wait_time > 0.001:
		time.wait_time = time.wait_time / time_Reduce
		print("Enemy increse")
