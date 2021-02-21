extends Area

tool

export (String) var next_level


export var active = true setget set_activate


func _ready():
	set_activate(active)


func _on_Area_body_entered(body):
	if active and body.get_parent() is Player:
		MusicManager.stop_music()
		yield(MusicManager,"stopped")
		SceneManager.change_levels(next_level)
		TimeManager.stop_timer()

func set_activate(yes):
	if !yes:
		$MeshInstance.mesh.material.albedo_texture = preload("res://Entities/LevelEnd/lock.png")
	else:
		$MeshInstance.mesh.material.albedo_texture = null
	active=yes
