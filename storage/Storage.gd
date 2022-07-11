extends Node

signal item_change

export var items := []
export(int) var storage_size = 36

func add_item(item: Resource) -> void:
	if items.size() >= storage_size: return
	items.append(item)
	emit_signal("item_change")
	
func remove_item(item: Resource) -> void:
	if !items.find(item): return
	items.erase(item)
	emit_signal("item_change")
	
func add_item_from_string(item: String) -> void:
	if items.size() >= storage_size: return
	items.append(item_manager.get_item(item))
	emit_signal("item_change")
	
func remove_item_from_string(item: String) -> void:
	if !items.find(item): return
	items.erase(item_manager.get_item(item))
	emit_signal("item_change")
	
func use_item(item: Resource) -> void:
	pass
