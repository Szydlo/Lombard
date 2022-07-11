extends Control

onready var item_icon = $ItemIcon
onready var item_name = $ItemName
onready var client_price = $ClientPrice
onready var player_price = $PlayerPrice

export(int) var price_factor = 10
export(int) var min_price = 10
export(int) var actual_price = min_price

func _ready() -> void:
	visible = false
	offer_manager.connect("sold_item", self, "_on_sold_item")
	client_manager.connect("client_left", self, "_on_client_left")

func set_offer_ui(item: Resource, cprice: int) -> void:
	visible = true
	actual_price = cprice
	item_name.text = item.name
	client_price.text = "Cena klienta: " + str(cprice)
	player_price.text = str(cprice)
	item_icon.texture = item.icon

func _on_Minus_pressed() -> void:
	if actual_price > min_price:
		actual_price -= price_factor
		
	player_price.text = str(actual_price)

func _on_Plus_pressed() -> void:
	actual_price += price_factor
	
	player_price.text = str(actual_price)

func _on_Offer_pressed() -> void:
	offer_manager.try_offer(actual_price)

func _on_sold_item() -> void:
	visible = false

func _on_client_left() -> void:
	visible = false
