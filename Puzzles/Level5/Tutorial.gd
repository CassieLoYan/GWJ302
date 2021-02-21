extends Spatial


export (float) var speed = 1

func _ready():
	RhythmManager.set_speed(speed)
