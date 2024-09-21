extends CanvasLayer

@onready var resume_button: Button = %ResumeButton
@onready var main_menu_button: Button = %MainMenuButton
@onready var exit_button: Button = %ExitButton
@onready var confirm_modal: ConfirmModal = %ConfirmModal

func _ready() -> void:
	resume_button.pressed.connect(_on_resume_button_pressed)
	main_menu_button.pressed.connect(_on_main_menu_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)

func _on_pause():
	get_tree().paused = true
	show()

func _on_unpause():
	hide()
	get_tree().paused = false
	
func _on_resume_button_pressed():
	_on_unpause()

func _on_main_menu_button_pressed():
	pass

func _on_exit_button_pressed():
	var confirmed = await confirm_modal.ask_confirmation("Do you really want to quit?", "Yes", "No")
	
	if confirmed:
		get_tree().quit()
