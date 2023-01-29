extends Button

onready var tut : String = "res://Templates/Tutorial.tscn"

func _on_Tutorial_button_down():
	SoundM.play_button()
	Global.set_for_tutorial()
	get_tree().change_scene(tut)
