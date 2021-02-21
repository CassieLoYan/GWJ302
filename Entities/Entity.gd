extends MeshInstance
class_name Entity
signal moved
signal started_moving
onready var tween = Tween.new()
onready var ray = RayCast.new()
var time_since_press = 0
var next_move = Vector3.ZERO
var last_move = Vector3.ZERO
func _ready():
	add_to_group("entities")
	add_child(tween)
	add_child(ray)
	ray.transform.origin=Vector3.ZERO
	

func move(dir):
	ray.set_cast_to(dir)
	ray.force_raycast_update()
	if !ray.is_colliding():
		emit_signal("started_moving")
		tween.interpolate_property(self,"global_transform:origin",global_transform.origin,global_transform.origin+dir,0.1,Tween.TRANS_CUBIC,Tween.EASE_OUT)
		tween.start()
		last_move=dir
	yield(tween,"tween_completed")
	emit_signal("moved")
