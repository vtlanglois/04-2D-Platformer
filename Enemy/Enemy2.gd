extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startY : int = position.y
onready var targetY : int = position.y + moveDist

func _process (delta):
	position.y = move_to(position.y, targetY, speed * delta)
	if position.y == targetY:
		if targetY == startY:
			targetY = position.y + moveDist
		else:
			targetY = startY

# moves "current" towards "to" at a rate of "step"
func move_to (current, to,step):
	var new = current

	# are we moving positive?
	if new < to:
		new += step 
		if new > to:
			new = to
		#are we moving negative?
	else:
		new -= step 
		if new < to:
			new = to            
	return new


func _on_Node2D_body_entered(body):
	var Level = load("res://Levels/Level" + str(Global.lvl) + ".tscn")
	var _scene = get_tree().change_scene_to(Level)
	call_deferred("restart_level")
