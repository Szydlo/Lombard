extends GridContainer

onready var item_slot_scene = preload("res://storage/ItemSlot.tscn")

func _ready() -> void:
	for index in range(0, storage.storage_size):
		add_child(item_slot_scene.instance())
		
	storage.connect("item_change", self, "_on_item_change")
	
	refresh_item_slots()

func refresh_item_slots():
	var item_slot: Button
	
	for index in range(0, storage.storage_size):
		item_slot = get_child(index)
		
		if range(storage.items.size()).has(index):
			item_slot.icon = storage.items[index].icon
		else:
			item_slot.icon = null

func _on_item_change():
	refresh_item_slots()
