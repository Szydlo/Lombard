extends Node

var ui_dialog: Control
export(String) var actual_line = "0"
var actual_dialog: Dictionary

func init() -> void:
	ui_dialog = get_node("/root/Node2D/Interface/Dialogs/")
	ui_dialog.visible = false

func set_line(line: String) -> void:
	if !ui_dialog: return
	actual_line = line
	
	ui_dialog.answers_bg.visible = true
	
	var answers: Array = []
	var answers_size: int = actual_dialog[actual_line]["answers"].size()
	
	for i in range(0, answers_size):
		answers.insert(i, actual_dialog[actual_line]["answers"][i]["text"])
		
	ui_dialog.set_answers_ui(answers)
	ui_dialog.set_dialog_ui(client_manager.actual_client.name, actual_dialog[actual_line]["text"])

func set_dialog() -> void:
	if !ui_dialog: return
	
	set_line("0")

func set_new_dialog() -> void:
	actual_dialog = client_manager.actual_client.get_dialog()
	set_dialog()

func hide_answers() -> void:
	ui_dialog.answers_bg.visible = false
