extends CanvasLayer


func _on_pause():
	get_tree().paused = true
	show()

func _on_unpause():
	hide()
	get_tree().paused = false
