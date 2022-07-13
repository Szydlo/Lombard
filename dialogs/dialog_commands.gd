extends Node

func call_func(name: String, args: Array):
	return call(name, args)

func print_something(args: Array) -> void:
	print(args[0])
	
func go_to_dialog(args: Array) -> void:
	dialog_manager.set_line(args[0])
	
func next_client_with_timer(args: Array) -> void:
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = args[0]
	timer.one_shot = true
	timer.start()
	timer.connect("timeout", self, "_on_timer_timeout")

func end_game(args: Array) -> void:
	gamemode.end_game(args[0])

func next_client(args: Array) -> void:
	day_manager.next_client()

func buy_item(args: Array) -> void:
	offer_manager.set_offer(args[0], false)
	
func sell_item(args: Array) -> void:
	offer_manager.set_offer(args[0], true)

func hide_answers(args: Array) -> void:
	dialog_manager.hide_answers()

func set_dialog_text(args: Array) -> void:
	dialog_manager.ui_dialog.set_dialog_ui(client_manager.actual_client.name, args[0])

func set_is_able_to_enter(args: Array) -> void:
	client_manager.get_client_from_name(args[0]).is_able_to_enter = args[1]

func has_item(args: Array) -> bool:
	return !storage.has_item(args[0])
	
func has_not_item(args: Array) -> bool:
	return storage.has_item(args[0])

func _on_timer_timeout() -> void:
	day_manager.next_client()
	
