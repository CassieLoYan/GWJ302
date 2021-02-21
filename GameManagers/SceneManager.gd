extends Node

onready var tween = $Control/Tween
onready var black = $Control/ColorRect

func change_levels(level):
	tween.interpolate_property(black,"anchor_right",0,1,0.5)
	tween.start()
	RhythmManager.stop()
	yield(tween,"tween_completed")
	if level is String:
		level = load(level)
	yield(get_tree().create_timer(0.5),"timeout")
	var __ = get_tree().change_scene_to(level)
	tween.interpolate_property(black,"anchor_right",1,0,0.5)
	tween.start()
	yield(tween,"tween_completed")
	RhythmManager.start()

func restart_level():
	tween.interpolate_property(black,"anchor_right",0,1,0.5)
	tween.start()
	RhythmManager.stop()
	yield(tween,"tween_completed")
	yield(get_tree().create_timer(0.5),"timeout")
	var __ = get_tree().reload_current_scene()
	tween.interpolate_property(black,"anchor_right",1,0,0.5)
	tween.start()
	yield(tween,"tween_completed")
	RhythmManager.start()
