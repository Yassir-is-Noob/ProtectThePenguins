extends Node2D

var enemies_spawn : bool = true setget set_enemies_spawn
var dont_shoot : bool = false setget set_shoot
var old_score : int = 0
var autoshoot_for_game : bool = true
var clouds_onfield : int = 0 setget set_clouds_num

var game_data = {
	"cloud_fire_rate"       : 0.25,
	"cloud_damage"          : 25,
	"cloud_bullets_left"    : 10,
	"cloud_cost"            : 50, # workers
	"cloud_center_position" : [],
	"cloud_health"          : 100,
	"cloud_price"           : 100,
	
	"enemies_health"         : 50,
	"enemies_speed"          : 80,
	"enemies_worth"          : 10,
	"enemies_spawn_rate"     : 1.5,
	"enemies_damage"         : 50,
	
	"currency"               : 500,
	"score"                  : 0,
	
	"cult_pray_cost"         : 10,
	"cult_health"            : 200,
	"cult_position"          : Vector2.ZERO
}

func set_enemies_spawn(value):
	enemies_spawn = value
func set_shoot(value):
	dont_shoot = value
	
func worker_did_work():
#	game_data.fire_rate -= 0.1
	game_data.turret_bullets_left += 1
	game_data.turret_bullet_damage += 1

func game_over():
	enemies_spawn = false
	get_tree().call_group("AddingPenguins", "stop")
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy._on_healthBar_death()
	get_tree().change_scene("res://Templates/start_menu.tscn")

func edifficulty_scale():
	if game_data.score > old_score + 500 :
		game_data.cloud_damage += 10
		game_data.enemies_health += 30
		game_data.enemies_speed += 5
		game_data.enemies_worth += 4
		old_score += 700

func hdifficulty_scale():
	game_data.enemies_health += 100
	game_data.cloud_damage += 200
	game_data.enemies_speed *= 1.3
	game_data.cult_pray_cost += 5
	game_data.enemies_spawn_rate -= 0.6

func reset():
	enemies_spawn = true
	autoshoot_for_game = true
	game_data = {
	"cloud_fire_rate"       : 0.25,
	"cloud_damage"          : 25,
	"cloud_bullets_left"    : 10,
	"cloud_cost"            : 50, # workers
	"cloud_center_position" : [],
	"cloud_health"          : 100,
	"cloud_price"           : 100,
	
	"enemies_health"         : 50,
	"enemies_speed"          : 80,
	"enemies_worth"          : 10,
	"enemies_spawn_rate"     : 1.5,
	"enemies_damage"         : 50,
	
	"currency"               : 5000,
	"score"                  : 0,
	
	"cult_pray_cost"         : 10,
	"cult_health"            : 200,
	"cult_position"          : Vector2.ZERO
}

func set_for_tutorial():
	reset()
	autoshoot_for_game = false
	game_data.cloud_bullets_left = 0
	game_data.currency = 1060

func set_clouds_num(value : int):
	clouds_onfield = value
	if clouds_onfield == 0 :
		get_tree().call_group("AddingPenguins", "stop")
