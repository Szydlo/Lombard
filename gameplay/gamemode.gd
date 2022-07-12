extends Node

onready var end_game_screen: PackedScene = preload("res://endscreens/endgame_scene.tscn")

export(int) var DEFAULT_MONEY = 1000

func _init():
	OS.window_size = Vector2(1280, 720)

func start_game() -> void:
	furnitures_manager.load_furnitures()
	player.money = DEFAULT_MONEY
	pawn_shop.calculate_shop_stats()
	dialog_manager.init()
	offer_manager.init()
	
	#always on end
	day_manager.next_client()

func end_game(reason: String) -> void:
	var scene := end_game_screen.instance()
	get_parent().add_child(scene)
	get_parent().get_node("/root/Node2D").queue_free()
	scene.set_endgame_ui(reason)
