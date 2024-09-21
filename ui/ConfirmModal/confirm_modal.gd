extends Control
class_name ConfirmModal

signal confirmed(bool)

@onready var message_label: Label = %MessageLabel
@onready var ok_button: Button = %OkButton
@onready var cancel_button: Button = %CancelButton
@onready var backdrop: ColorRect = $"."

func _ready():
	ok_button.pressed.connect(_on_ok_button_pressed)
	cancel_button.pressed.connect(_on_cancel_button_pressed)

func ask_confirmation(text: String, ok_text: String, cancel_text: String) -> bool:
	set_process_unhandled_input(true)
	message_label.text = text
	ok_button.text = ok_text
	cancel_button.text = cancel_text
	show()
	return await confirmed

func _choose(is_ok: bool):
	confirmed.emit(is_ok)
	hide()
	set_process_unhandled_input(false)

func _on_ok_button_pressed():
	_choose(true)

func _on_cancel_button_pressed():
	_choose(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_choose(false)
