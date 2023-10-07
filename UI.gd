extends CanvasLayer

@onready var shout_label = $"Shout Label"


func _ready():
	await get_parent().ready
	
	get_parent().get_node("Player").everyone_come.connect(shout)

func shout(position):
	shout_label.show()
	await get_tree().create_timer(2).timeout
	shout_label.hide()
