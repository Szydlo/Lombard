extends VBoxContainer

func _ready() -> void:
	for val in furnitures_manager.furnitures.values():
		if val.is_upgrade_avaliable():
			var button := Button.new()
			button.text = "Ulepsz: " + val.name
			add_child(button)
			button.connect("pressed", self, "_on_button_click", [button])

func _on_button_click(button) -> void:
	var canUpgrade: bool = furnitures_manager.furnitures[button.text.replace("Ulepsz: " , "")].upgrade()
	
	if !canUpgrade:
		button.queue_free()
		
	pawn_shop.calculate_shop_stats()
