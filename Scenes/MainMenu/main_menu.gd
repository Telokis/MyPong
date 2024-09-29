extends Control

@onready var confirm_modal: ConfirmModal = %ConfirmModal

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")


func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/SettingsMenu/settings_menu.tscn")


func _on_exit_button_pressed() -> void:
	var confirmed = await confirm_modal.ask_confirmation("Do you really want to quit?", "Yes", "No")
	
	if confirmed:
		get_tree().quit()
