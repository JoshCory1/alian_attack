extends Node2D

var lives = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var gameover = preload("res://prefabs/game_overscreen.tscn")

func _ready():
	hud.set_score_lable(score)
	hud.set_lives(lives)
func _on_area_2d_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives -= 1
	score -= 100
	hud.set_lives(lives)
	if lives == 0:
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var gos = gameover.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
		


func _on_enemy_spawner_enemy_spwaned(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)


func on_enemy_died():
	score += 100
	hud.set_score_lable(score)
