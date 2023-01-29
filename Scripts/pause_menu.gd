extends CanvasLayer

var pause : bool = false

func _ready():
	visible = false

func _process(_delta):
#	if event is InputEventKey:
#		if event.pressed and event.scancode == KEY_ESCAPE:
	if Input.is_action_just_pressed("pause"):
		SoundM.play_button()
		pause = !pause 
		visible = pause
		get_tree().paused = pause


func _on_Tutorial_button_down():
	SoundM.play_button()
	get_tree().paused = false
	get_tree().change_scene("res://Templates/start_menu.tscn")


func _on_Play_button_down():
	SoundM.play_button()
	Global.reset()
	get_tree().paused = false
	get_tree().reload_current_scene()
