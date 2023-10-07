extends Sprite2D

signal everyone_come

func _on_button_call_white_pressed():
	get_parent().get_node("White Dog").goto_point(position)


func _on_button_call_all_pressed():
	# easier to send a signal and let the dogs figure out
	# what to do with it, than to call each dog individually
	#
	# also: The UI can connect to this signal if it wants to,
	# without us having to worry about any of it in this script
	 
	everyone_come.emit(position)
