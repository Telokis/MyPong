extends Control


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu/main_menu.tscn")


func _on_master_volume_h_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	print("%f : %f" % [value, linear_to_db(value)])
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
