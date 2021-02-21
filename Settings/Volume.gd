extends Panel


onready var audio = AudioServer#preload("res://default_bus_layout.tres")
func _on_HSlider_value_changed(value):
	MusicManager.volume_db=value
	#AudioServer.get_


func _on_HSlider2_value_changed(value):
	print(audio.bus_count)
	audio.set_bus_volume_db(audio.get_bus_index("SFX"),value)
