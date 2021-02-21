extends Spatial


export (float) var speed = 1
export (AudioStream) var song

func _ready():
	RhythmManager.set_speed(speed)
	RhythmManager.start()
	print(RhythmManager.forgive_time)
	var __ = RhythmManager.connect("started",self,"start_music")
#	__ = RhythmManager.connect("pause",self,"pause_music")
	TimeManager.start_timer()

func start_music():
	MusicManager.switch_music(song)
	
#func pause_music(pause):
#	pass#$AudioStreamPlayer.stream_paused=pause
