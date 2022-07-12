extends Control

onready var client_name = $DialogBG/DialogContainer/ClientName
onready var client_text = $DialogBG/DialogContainer/ClientText

onready var answers_bg = $AnswersBG
onready var answers_container = $AnswersBG/AnswersContainer

func _ready():
	client_manager.connect("client_left", self, "_on_client_left")

func set_dialog_ui(cname : String, ctext : String) -> void:
	client_name.text = cname
	client_text.text = ctext
	
	visible = true

func set_answers_ui(answers: Array) -> void:
	for button in answers_container.get_children():
		button.queue_free()
	
	for i in range(answers.size()):
		if answers[i] != "":
			var button := Button.new()
			button.text = answers[i]
			answers_container.add_child(button)
			button.connect("pressed", self, "_on_Answers_clicked", [i])

func _on_client_left() -> void:
	visible = false

func _on_Answers_clicked(index: int) -> void:
	var functions: Array = dialog_manager.actual_dialog[dialog_manager.actual_line]["answers"][index]["functions"]
	
	for i in range(0, functions.size()):
		dialog_commands.call_func(functions[i]["action"], functions[i]["arguments"])
