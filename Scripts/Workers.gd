extends KinematicBody2D

var picked_turret : int
var position_picked : Vector2
var velocity : Vector2
var speed : int = 0
var offset : int = 50

func _ready():
#	$AnimationPlayer.play("walking")
	randomize()
	# picking a turret
	if len(Global.game_data.turret_center_position) > 1:
		picked_turret = randi() % len(Global.game_data.turret_center_position)
	else :
		picked_turret = 0
		
	# 100 is a simple offset
	var x = rand_range(-offset,offset)
	var y = rand_range(x+offset,x-offset)
	position_picked =	Global.game_data.turret_center_position[picked_turret] + Vector2(x,y)
	
func _process(_delta):
	if position < position_picked:
		velocity = (position_picked - position).normalized()* speed
		move_and_slide(velocity)
	
func die():
	$Timer.start()

func _on_Timer_timeout():
#	get_node("AnimationPlayer").play("die")
	Global.worker_did_work()
