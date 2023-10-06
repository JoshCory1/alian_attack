extends Node2D

var enemy_scene = preload("res://prefabs/enemy.tscn")
@onready var spawn_position = $SpawnPositions

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawn_child = spawn_position.get_children()
	var random_spawn_posistion = spawn_child.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	spawn_position.add_child(enemy_instance)
	enemy_instance.global_position = random_spawn_posistion.global_position
