extends Control

onready var client_name = $DialogBG/DialogContainer/ClientName
onready var client_text = $DialogBG/DialogContainer/ClientText

onready var answer1 = $AnswersBG/AnswersContainer/Answer1
onready var answer2 = $AnswersBG/AnswersContainer/Answer2
onready var answer3 = $AnswersBG/AnswersContainer/Answer3

func _ready():
	client_manager.connect("client_left", self, "_on_client_left")

func set_dialog_ui(cname : String, ctext : String) -> void:
	client_name.text = cname
	client_text.text = ctext
	
	visible = true

func set_answers_ui(answers: Array) -> void:
	answer1.text = answers[0]
	answer2.text = answers[1]
	answer3.text = answers[2]
	
	if answers[0] == "":
		answer1.visible = false
	if answers[1] == "":
		answer2.visible = false
	if answers[2] == "":
		answer3.visible = false

func _on_client_left() -> void:
	visible = false
