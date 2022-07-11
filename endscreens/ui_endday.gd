extends Control

onready var info: Label = $Background/Container/Info
onready var new_day: Button = $Background/Container/newday

func set_endday_ui(reason: String) -> void:
	info.text = reason

func _on_newday_pressed():
	day_manager.make_new_day()
	queue_free()
