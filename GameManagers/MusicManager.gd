extends AudioStreamPlayer

var current_music : AudioStream
onready var tween = $Tween

signal stopped
signal started

func start_music():
	play()
	tween.interpolate_property(self,"volume_db",-80,-2,0.5)
	tween.start()
	yield(tween,"tween_all_completed")
	emit_signal("started")

func stop_music():
	tween.interpolate_property(self,"volume_db",volume_db,-20,0.5)
	tween.start()
	yield(tween,"tween_all_completed")
	emit_signal("stopped")

func switch_music(new_music):
	if current_music:
		stop_music()
		yield(self,"stopped")
	current_music=new_music
	stream=current_music
	start_music()
