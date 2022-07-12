extends Control

onready var text_label := $Text
onready var press_label := $Press
onready var background := $Background
onready var text_tween = $TextTween
onready var fade_tween = $FadeTween

func _ready():
	visible = true
	press_label.visible = false
	text_tween.interpolate_property(text_label, "percent_visible", 0.0, 1.0, 5)
	text_tween.start()

func _on_TextTween_tween_completed(object, key):
	press_label.visible = true

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and press_label.visible == true:
		fade_tween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1)
		fade_tween.start()
	elif Input.is_action_just_pressed("ui_accept") and press_label.visible == false:
		text_tween.stop_all()
		text_label.percent_visible = 1.0
		press_label.visible = true

func _on_FadeTween_tween_completed(object, key):
	gamemode.start_game()
	queue_free()
