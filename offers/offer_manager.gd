extends Node

export(int) var client_price = 0
export(Resource) var selling_item

var ui_offer: Control

signal sold_item()
signal client_left()

func init() -> void:
	ui_offer = get_node("/root/Node2D/Interface/Offer")

func set_offer(item: String) -> void:
	var item_res: Resource = item_manager.get_item(item)
	selling_item = item_res
	client_price = client_manager.actual_client.calculate_price(item_res.price)
	
	print("client price: " + str(client_price))
	print("min price: " + str(client_manager.actual_client.calculate_min_price(client_price)))
	print("anger price: " + str(client_manager.actual_client.calculate_anger_price(client_price)))
	
	ui_offer.set_offer_ui(item_res, client_price)
	
func try_offer(price: int) -> void:
	if !selling_item: return
	var actual_client: Resource = client_manager.actual_client
	
	if actual_client.calculate_min_price(client_price) <= price:
		if player.take_money(price):
			storage.add_item(selling_item)
			emit_signal("sold_item")
			day_manager.next_client()
	elif actual_client.is_annoyed_enough():
		emit_signal("client_left")
		day_manager.next_client()
	else:
		if actual_client.calculate_anger_price(client_price) >= price:
			actual_client.actual_anger += actual_client.anger_factor
			
		actual_client.actual_patience += actual_client.patience_factor
		
