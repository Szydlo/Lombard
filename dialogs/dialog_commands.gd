extends Node

func call_func(name: String, args: Array) -> void:
	call(name, args)

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

func next_client(args: Array) -> void:
	day_manager.next_client()

func sell_item(args: Array) -> void:
	offer_manager.set_offer(args[0])

func hide_answers(args: Array) -> void:
	dialog_manager.hide_answers()

func set_dialog_text(args: Array) -> void:
	dialog_manager.ui_dialog.set_dialog_ui(client_manager.actual_client.name, args[0])

func _on_timer_timeout() -> void:
	day_manager.next_client()
