extends KinematicBody2D
signal hit

var speed : int = 50
onready var sprt = get_node("Sprite")
var target_position : int

func _ready():
#	add_to_group("penguin")
	get_node("AnimationPlayer").play("join_cult")
	target_position = position.y
	position.y += 200
	 

func _process(delta):
	if position.y > target_position :
		move_and_slide(Vector2.UP * speed)
	else :
		get_node("AnimationPlayer").play("idle")


func _on_prayButton_button_up():
	SoundM.play_pray()
	sprt.animation = "pray"
	get_node("AnimationPlayer").play("pray")

func kill_penguin():
	emit_signal("hit")
	remove_from_group("penguin")
	get_tree().call_group("Enemies", "change_target")
	queue_free()

