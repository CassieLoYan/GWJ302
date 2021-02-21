extends Entity

class_name Player

#var time_since_press = 0



var losing_health = false
var hp = 3
onready var hps = $Control/HBoxContainer
func _process(delta):
	get_input()
	time_since_press+=delta

func get_input():
	if Input.is_action_just_pressed("forwards"):
		next_move = (Vector3(0,0,-1))
		on_press()
	elif Input.is_action_just_pressed("backwards"):
		next_move = (Vector3(0,0,1))
		on_press()
	elif Input.is_action_just_pressed("left"):
		next_move = (Vector3(-1,0,0))
		on_press()
	elif Input.is_action_just_pressed("right"):
		next_move = (Vector3(1,0,0))
		on_press()

func on_press():
	time_since_press=0
	var suc = RhythmManager.check_beat()
	if suc=="FAIL":
		damage()
	elif suc == "PERFECT":
		$Control/Label.show()
		heal()

func _on_HealthTimer_timeout():
	if losing_health:
		damage()

func damage():
	ScoreManager.increase_score(-25)
	hp-=1
	#hp = clamp(hp,0,3)
	RhythmManager.chromatic_aberration_glitch(20)
	hps.get_children()[hp-1].queue_free()
	if hp <= 0:
		die()
	$AudioStreamPlayer.stream=preload("res://Sounds/Hurt.wav")
	$AudioStreamPlayer.play()

func die():
	var d_p = $CPUParticles
	remove_child(d_p)
	get_parent().add_child(d_p)
	d_p.global_transform.origin=global_transform.origin
	d_p.emitting=true
	hide()
	$AudioStreamPlayer.stream=preload("res://Sounds/Explode.wav")
	$AudioStreamPlayer.play()
	ScoreManager.increase_score(-125)
	yield(get_tree().create_timer(1),"timeout") 
	SceneManager.restart_level()

func heal():
	if hp < 5:
		var new_hp = TextureRect.new()
		hps.add_child(new_hp)
		new_hp.texture=preload("res://UI/Icons/Life.png")
		hp+=1
