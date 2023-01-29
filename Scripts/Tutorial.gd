extends Node2D

func _ready():
	$enemy_spawner/Timer.stop()

func _on_Clouders_added_cloud():
	$enemy_spawner/Timer.start()
