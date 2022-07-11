extends Node

var items_database: Dictionary = {}

func load_items() -> void:
	var dir := Directory.new()
	dir.open("res://items/items")
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
	
		if file == "":
			break
		elif not file.begins_with("."):
			var res: Resource = load("res://items/items/" + file)
			items_database[res.id] =res
	
	dir.list_dir_end()

func _ready() -> void:
	load_items()
	
func get_item(id: String) -> Resource:
	return items_database[id]
