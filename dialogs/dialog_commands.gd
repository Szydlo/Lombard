extends Node

func call_func(name: String, args: Array) -> void:
	call(name, args)

func print_something(args: Array) -> void:
	print(args[0])
	
func go_to_dialog(args: Array) -> void:
	dialog_manager.set_line(args[0])
	
func new_client(args: Array) -> void:
	day_manager.next_client()

func sell_item(args: Array) -> void:
	offer_manager.set_offer(args[0])
