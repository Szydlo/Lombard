extends Node

var ui_dialog: Control
export(String) var actual_line = "0"
var actual_dialog: Dictionary

func init() -> void:
	ui_dialog = get_node("/root/Node2D/Interface/Dialogs/")
	
	ui_dialog.answer1.connect("pressed", self, "_on_answer1")
	ui_dialog.answer2.connect("pressed", self, "_on_answer2")
	ui_dialog.answer3.connect("pressed", self, "_on_answer3")
	ui_dialog.visible = false

func set_line(line: String) -> void:
	if !ui_dialog: return
	actual_line = line
	
	var answers: Array = ["", "", ""]
	var answers_size: int = actual_dialog[actual_line]["answers"].size()-1
	
	if answers_size >= 0:
		answers[0] = actual_dialog[actual_line]["answers"][0]["text"]
	if answers_size >= 1:
		answers[1] = actual_dialog[actual_line]["answers"][1]["text"]
	if answers_size >= 2:
		answers[2] = actual_dialog[actual_line]["answers"][2]["text"]
		
	ui_dialog.set_answers_ui(answers)
	ui_dialog.set_dialog_ui(client_manager.actual_client.name, actual_dialog[actual_line]["text"])

func set_dialog() -> void:
	if !ui_dialog: return
	
	set_line("0")

func set_new_dialog() -> void:
	actual_dialog = client_manager.actual_client.get_dialog()
	set_dialog()

func _on_answer1() -> void:
	var functions: Array = actual_dialog[actual_line]["answers"][0]["functions"]
	
	for i in range(0, functions.size()):
		dialog_commands.call_func(functions[i]["action"], functions[i]["arguments"])

func _on_answer2() -> void:
	var functions: Array = actual_dialog[actual_line]["answers"][1]["functions"]
	
	for i in range(0, functions.size()):
		dialog_commands.call_func(functions[i]["action"], functions[i]["arguments"])
	
func _on_answer3() -> void:
	var functions: Array = actual_dialog[actual_line]["answers"][2]["functions"]
	
	for i in range(0, functions.size()):
		dialog_commands.call_func(functions[i]["action"], functions[i]["arguments"])
