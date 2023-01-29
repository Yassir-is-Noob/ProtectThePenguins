extends Button

onready var game : String = "res://Templates/Game.tscn" 

func _on_Play_button_down():
	SoundM.play_button()
	Global.reset()
	get_tree().change_scene(game)
