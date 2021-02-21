extends Entity

export (int, 0, 270, 90) var angle
var dir = Vector3(0,0,1)
func _ready():
	rotation_degrees.y=angle
	dir = dir.rotated(Vector3.UP,rotation.y)

func _on_Area_body_entered(body):
	if body.get_parent() is Player:
		yield(body.get_parent(),"moved")
		move_entity(body)
#		body.get_parent().move(dir)
#		body.get_parent().emit_signal("moved")

func move_entity(entity):
	ray.set_cast_to(dir.rotated(Vector3.UP,-rotation.y))
	ray.add_exception(entity)
#	var ray = RayCast.new()
#	ray.add_exception()
	print("mv", entity)
	ray.force_raycast_update()
	if !ray.is_colliding():
		print("moving ",entity)
		entity.get_parent().last_move=Vector3.ZERO
		tween.interpolate_property(entity.get_parent(),"global_transform:origin",global_transform.origin,global_transform.origin+dir,0.05,Tween.TRANS_CUBIC,Tween.EASE_OUT)
		tween.start()
	else:
		print(ray.get_collider())
