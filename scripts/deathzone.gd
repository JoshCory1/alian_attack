extends Node2D

var lives = 3
var score = 0
@onready var player = $Player

func _on_area_2d_area_entered(area):
	area.die()


func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		print("GAME OVER!!!!")
		player.die()
	elif lives > -1:
		print("your lives are ", lives)
		


func _on_enemy_spawner_enemy_spwaned(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)


func on_enemy_died():
	score += 100
	print("score: " + str(score))
