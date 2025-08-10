extends Control

## Used when the user presses the "back" button
signal back_requested

func _on_back_button_pressed() -> void:
	back_requested.emit()


func _on_master_volume_h_slider_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	print("%f : %f" % [value, linear_to_db(value)])
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
