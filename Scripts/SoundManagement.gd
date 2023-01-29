extends Node2D

func play_button():
	randomize()
	$Button.pitch_scale = rand_range(0,1)
	$Button.play()

func play_fire_idle():
	$fire_idle.volume_db = -20
	$fire_idle.play()


func play_fire_death():
	randomize()
	$fire_death.volume_db = -10
#	$fire_death.pitch_scale = rand_range(0,2)	
	$fire_death.play()


func play_fire_death2():
	randomize()
	$fire_death2.volume_db = -10
#	$fire_death2.pitch_scale = rand_range(0,2)	
	$fire_death2.play()


func play_shoot():
	randomize()
	$shoot.volume_db = -10
	$shoot.pitch_scale = rand_range(0.5,1.5)	
	$shoot.play()

func play_pray():
	randomize()
	$pray.volume_db = rand_range(-10,1)
	$pray.pitch_scale = rand_range(1,1.5)	
	$pray.play()

func play_add_cloud():
	randomize()
	$add_cloud.volume_db = rand_range(-10,1)
	$add_cloud.pitch_scale = rand_range(0,2)	
	$add_cloud.play()

