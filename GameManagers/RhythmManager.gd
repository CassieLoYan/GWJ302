extends Control

var forgive_time = 0.2

var time = 0.1
var speed = 1

onready var heartbeat_mat=preload("res://Heartbeat.tres")
onready var tween = $CanvasLayer/Tween
onready var chroma = $CanvasLayer/ColorRect.material
onready var timer = $Timer

var on_beat = false

signal started
signal pause

func _ready():
	stop()
#	yield(get_tree().create_timer(0.5),"timeout")
#	start()
	#emit_signal("started")

func set_speed(new_speed):
	speed=new_speed
	time=0
	timer.stop()
	timer.wait_time=float(1)/float(speed)
	forgive_time=timer.wait_time*0.2
	timer.start()
	heartbeat_mat.set_shader_param("speed",speed)


func stop():
	timer.stop()
	time=0
	heartbeat_mat.set_shader_param("timer",0)
	set_process(false)
	emit_signal("pause",true)

func start():
	timer.start()
	time=0
	heartbeat_mat.set_shader_param("timer",0)
	set_process(true)
	emit_signal("started")
	emit_signal("pause",false)

func _process(delta):
	time+=delta*speed
	heartbeat_mat.set_shader_param("timer",time)
	#print(timer.get_time_left())

func _on_Timer_timeout():
	on_beat=true
	$AudioStreamPlayer.play()
	chromatic_aberration_glitch(5)
	#stop()
	yield(get_tree().create_timer(0.1),"timeout")
	for entity in get_tree().get_nodes_in_group("entities"):
		if entity.time_since_press < forgive_time+0.1:
			entity.move(entity.next_move)
		entity.next_move = Vector3.ZERO
	
	on_beat=false
	#emit_signal("pause",false)
	#start()

func check_beat():
	var t = timer.get_time_left()
	print(t)
	if t < 0.05 or t > ((float(1)/float(speed))-0.05):
		ScoreManager.increase_score(100)
		return "PERFECT"
	if t < forgive_time or t > (float(1)/float(speed))-forgive_time:
		ScoreManager.increase_score(50)
		return "GOOD"
	return "FAIL"
		



func chromatic_aberration_glitch(amount):
	tween.interpolate_property(chroma,"shader_param/offset",1.5,amount,0.1,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
	tween.start()
	yield(get_tree().create_timer(0.1),"timeout")
	tween.interpolate_property(chroma,"shader_param/offset",amount,1.5,0.1,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
	tween.start()
