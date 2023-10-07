extends Node2D

@export var color: Color

var spawn_point: Vector2


func _ready():
	# remember spawn point
	spawn_point= position

	$"Sprite Base".modulate= color
	
	# wait for parents ready signal so we know all nodes
	# have been added, including the player
	await get_parent().ready

	# if the player calls everyone, we should go to him
	get_parent().get_node("Player").everyone_come.connect(goto_point)



func goto_point(point: Vector2):
	look_to_target(point)
	
	# use a tween to move
	var tween= get_tree().create_tween()
	tween.tween_property(self, "position", point, 3)
	tween.tween_callback(arrived_at_point)

func look_to_target(point: Vector2):
	# flip the sprites directions depending on where we are going
	if position.x > point.x:
		$"Sprite Base".flip_h= true
		$"Sprite Features".flip_h= true
	else:
		$"Sprite Base".flip_h= false
		$"Sprite Features".flip_h= false

func arrived_at_point():
	await get_tree().create_timer(3).timeout
	go_back_to_spawn()


func go_back_to_spawn():
	look_to_target(spawn_point)
	
	# use a tween to move
	var tween= get_tree().create_tween()
	tween.tween_property(self, "position", spawn_point, 3)

