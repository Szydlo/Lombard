extends Control

onready var info: Label = $Background/Container/Info

func set_endgame_ui(reason: String) -> void:
	info.text = reason

func _on_leave_pressed():
	get_tree().quit()
