extends CanvasLayer

onready var tween = $FadeTween
onready var fade = $Fade

func _ready():
	fade.visible = true
	tween.interpolate_property(fade, "modulate", Color(0,0,0,1), Color(0,0,0,0), 0.5)
	tween.start()

func _on_FadeTween_tween_completed(_object, _key):
	fade.visible = false
