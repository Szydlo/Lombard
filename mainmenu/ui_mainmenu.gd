extends Control

const game_scene = preload("res://gameplay/Game.tscn")

onready var audio_player := $MainMenuPlayer
onready var fade := $Fade
onready var tween := $Tween
onready var scene_fade := $SceneFade

func _ready() -> void:
	fade.visible = true
	scene_fade.connect("tween_completed", self, "_on_Tween_tween_completed")
	tween.interpolate_property(fade, "modulate", Color(0, 0, 0, 1), Color(0, 0, 0, 0), 1)
	tween.start()

func _on_Play_pressed() -> void:
	fade.visible = true
	
	scene_fade.interpolate_property(fade, "modulate", Color(0, 0, 0, 0), Color(0, 0, 0, 1), 0.5)
	scene_fade.start()

func _on_Options_pressed() -> void:
	pass # Replace with function body.

func _on_Exit_pressed() -> void:
	get_tree().quit()

func _on_Tween_tween_completed(_object, _key) -> void:
	var _value := get_tree().change_scene_to(game_scene)
