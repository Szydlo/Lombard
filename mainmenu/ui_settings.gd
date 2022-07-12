extends Control

### AUDIO STUFF
onready var main_volume := $TabContainer/Sound/VBoxContainer/MainVolumne
onready var music_volume := $TabContainer/Sound/VBoxContainer/MusicVolume
onready var sfx_volume := $TabContainer/Sound/VBoxContainer/SFXVolume

onready var master_bus := AudioServer.get_bus_index("Master")
onready var music_bus := AudioServer.get_bus_index("Music")
onready var sfx_bus := AudioServer.get_bus_index("SFX")

### GAMPEPLAY STUFF

onready var language_bar := $TabContainer/Gameplay/Container/Language

export(Array, String) var supported_langs := ["en", "pl"]

### GRAPHICS STUFF

onready var resolution_bar := $TabContainer/Graphics/Container/Resolution
onready var fullscreen_box := $TabContainer/Graphics/Container/Fullscreen
onready var vsync_box := $TabContainer/Graphics/Container/Vsync

export(Array, String) var resolutions := ["1024x546", "1280x720", "1600x900", "1920x1080", "3440x1440"]

func str2res(text: String) -> Vector2:
	var splited := text.split("x")
	return Vector2(int(splited[0]), int(splited[1]))

func _ready():
	for res in resolutions:
		resolution_bar.add_item(res)
		
	for lang in supported_langs:
		language_bar.add_item(lang)

func _on_Exit_pressed() -> void:
	queue_free()

func _on_Apply_pressed():
	apply_music()
	apply_gameplay()
	apply_graphics()

func apply_music() -> void:
	AudioServer.set_bus_volume_db(master_bus, main_volume.value)
	AudioServer.set_bus_volume_db(music_bus, music_volume.value)
	AudioServer.set_bus_volume_db(sfx_bus, sfx_volume.value)
	
func apply_gameplay() -> void:
	TranslationServer.set_locale(language_bar.text)
	
func apply_graphics() -> void:
	OS.window_fullscreen = fullscreen_box.pressed
	OS.vsync_enabled = vsync_box.pressed
	OS.window_size = str2res(resolution_bar.text)
