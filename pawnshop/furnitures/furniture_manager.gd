extends Node

export var furnitures: Dictionary = {}

func load_furnitures() -> void:	
	var node := get_parent().get_node("/root/Node2D/Interface/Furnitures")
	
	for i in range(0, 	node.get_child_count()):
		var child = node.get_child(i)
		furnitures[child.name] = child
