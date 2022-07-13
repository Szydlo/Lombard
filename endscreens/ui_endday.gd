extends Control

onready var info: Label = $Background/Container/Info
onready var new_day: Button = $Background/Container/newday
onready var go_aboard: Button = $Background/Container/go_aboard

func set_endday_ui(reason: String) -> void:
	info.text = reason
	
	if player.money > 10000:
		go_aboard.visible = true

func _on_newday_pressed():
	day_manager.make_new_day()
	queue_free()


func _on_go_aboard_pressed():
	gamemode.end_game("Welcome in Russia :)")
	queue_free()
