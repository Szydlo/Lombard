extends Node

export(int) var actual_day = 0 setget set_day, get_day
export(int) var clients_for_actual_day = 2 # wszyscy klienci (startowa liczba)
export(int) var actual_clents = 0 # obsluzeni juz

signal end_day(reason)
signal new_day(day_number)

var endday_scene: PackedScene = preload("res://endscreens/endday_scene.tscn")

func end_day(reason: String) -> void:
	client_manager.leave_actual_client()
	emit_signal("end_day", reason)
	
	var scene := endday_scene.instance()
	get_parent().get_node("/root/Node2D/Interface").add_child(scene)
	scene.set_endday_ui(reason)

func make_new_day() -> void:
	self.actual_day += 1
	
func prepare_new_day() -> void:
	actual_clents = 0
	clients_for_actual_day = pawn_shop.calculate_clients()
	next_client()
	
func set_day(value: int) -> void:
	actual_day = value
	
	prepare_new_day()
	emit_signal("new_day", actual_day)

func get_day() -> int:
	return actual_day
	
func next_client() -> void:
	if actual_clents >= clients_for_actual_day:
		end_day("No more clients for today.\n{random_event}")
		return
	
	actual_clents += 1
	client_manager.set_new_client()
