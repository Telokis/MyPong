extends Control

@onready var confirm_modal: ConfirmModal = %ConfirmModal

@onready var settings_menu: Control = %SettingsMenu
@onready var menu: TextureRect = %Menu

func _ready() -> void:
	grab_focus()

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game/game.tscn")


func _on_settings_button_pressed() -> void:
	menu.hide()
	settings_menu.show()


func _on_exit_button_pressed() -> void:
	var confirmed = await confirm_modal.ask_confirmation("Do you really want to quit?", "Yes", "No")
	grab_focus()
	
	if confirmed:
		get_tree().quit()

func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		accept_event()
		_on_exit_button_pressed()
