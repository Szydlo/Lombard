extends Node

export(float) var fame = 1
export(float) var safety = 0
export(float) var apperance = 0

func calculate_shop_stats() -> void:
	safety = 0
	apperance = 0
	
	for val in furnitures_manager.furnitures.values():
		safety += val.calculate_security()
		apperance += val.calculate_apperance()

func calculate_clients() -> int:
	#calculate_shop_stats()
	#return int(max( ceil((fame + safety + apperance)) / 2, 5))
	return 4
