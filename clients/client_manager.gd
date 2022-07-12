extends Node

signal new_client(client)
signal client_left()

export(Resource) var actual_client
export(Resource) var last_client
export var clients_database := []

func load_clients() -> void:
	var dir := Directory.new()
	dir.open("res://clients/resources")
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
	
		if file == "":
			break
		elif not file.begins_with("."):
			clients_database.append(load("res://clients/resources/" + file))
	
	dir.list_dir_end()
	
func _ready() -> void:
	load_clients()
	
func is_able_to_enter(client: Resource) -> bool:
	return client.is_able_to_enter

func check_client(client:Resource) -> bool:
	return !is_able_to_enter(client) or last_client == client

func get_client_from_name(name: String) -> Resource:
	for client in clients_database:
		if client.name == name:
			return client
			
	return null

func get_random_client() -> Resource:
	randomize()
	var random_client: Resource = clients_database[randi() % clients_database.size()]

	var index:int = 0

	while check_client(random_client):
		random_client = clients_database[randi() % clients_database.size()]
		
		index += 1
		
		if index > clients_database.size():
			gamemode.end_game("No more clients.")
			return null
		
	return random_client
	
func set_new_client() -> void: 
	if actual_client:
		leave_actual_client()
		
	actual_client = get_random_client()
	
	if actual_client == null:
		return
	
	last_client = actual_client
	emit_signal("new_client", actual_client)

func leave_actual_client() -> void:
	actual_client = null
	emit_signal("client_left")
