extends Node2D

var one_time : bool = true
onready var penguin = load("res://Actors/penguin.tscn")

func _on_healthBar_game_over():
	Global.game_over()

func _on_prayButton_button_down():
	if one_time :
		get_node("AddPenguin").start()
		one_time = false

func _on_AddPenguin_timeout():
	var new_penguin = penguin.instance()
	var penguin_position = Vector2(rand_range(-200,200), rand_range(30,70)) 
	new_penguin.position += penguin_position
	add_child(new_penguin)
