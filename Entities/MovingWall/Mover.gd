extends Entity


export (Array, Vector3) var mov_array
var current_move=0
func _ready():
	connect("moved",self,"select_next_pos")
#	connect("started_moving",self,"close_area")
	select_next_pos()
	
func select_next_pos():
#	$Area/CollisionShape.disabled=false
	current_move+=1
	current_move=wrapi(current_move,0,mov_array.size())
	$Area/CollisionShape.disabled=false
	call_deferred("set_next_move")

func close_area():
	$Area/CollisionShape.disabled=true

func set_next_move():
	next_move=mov_array[current_move]

func _on_Area_body_entered(body):
	if body.get_parent() is Player:
		yield(self,"moved")
		var player = body.get_parent()
		var p_m = -player.last_move if player.last_move != Vector3.ZERO else -last_move
		repeal_player(player,p_m)
		#var p_m = Vector3.ZERO
		#if player.last_move != Vector3.ZERO:
		#	p_m=-player.last_move
		#else:
		#	p_m=-last_move
			#player.move(-last_move)
		#print(p_m)
		#player.move(p_m)
		player.damage()


func repeal_player(player,dir):
	ray.set_cast_to(dir)
	ray.force_raycast_update()
	if !ray.is_colliding():
		tween.interpolate_property(player,"global_transform:origin",global_transform.origin,global_transform.origin+dir,0.05,Tween.TRANS_CUBIC,Tween.EASE_OUT)
		tween.start()
		last_move=dir
