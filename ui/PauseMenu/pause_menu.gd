extends CanvasLayer

@onready var resume_button: Button = %ResumeButton
@onready var main_menu_button: Button = %MainMenuButton
@onready var exit_button: Button = %ExitButton
@onready var confirm_modal: ConfirmModal = %ConfirmModal

func _on_pause():
	get_tree().paused = true
	show()

func _on_unpause():
	hide()
	get_tree().paused = false
	
func _on_resume_button_pressed():
	_on_unpause()

func _on_main_menu_button_pressed():
	var confirmed = await confirm_modal.ask_confirmation("Return to main menu?", "Yes", "No")
	
	if confirmed:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://ui/MainMenu/main_menu.tscn")

func _on_exit_button_pressed():
	var confirmed = await confirm_modal.ask_confirmation("Do you really want to quit?", "Yes", "No")
	
	if confirmed:
		get_tree().quit()
