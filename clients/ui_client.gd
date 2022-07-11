extends TextureRect

onready var client_tween_in = get_parent().get_node("ClientTweenIn")
onready var client_tween_out = get_parent().get_node("ClientTweenOut")

var isTwenIn: bool = false
var actual_client: Resource

func _ready() -> void:
	client_manager.connect("new_client", self, "_on_new_client")
	client_manager.connect("client_left", self, "_on_client_left")
	day_manager.connect("end_day", self, "_on_end_day")

func set_client_ui(icon: Texture) -> void:
	texture = icon

func twen_in() -> void:
	flip_h = false
	client_tween_in.interpolate_property(self, "rect_position:x", self.rect_position.x, self.rect_position.x + self.rect_size.x, 0.5)
	client_tween_in.start()
	
	set_client_ui(actual_client.apperance)
	
func twen_out() -> void:
	flip_h = true
	client_tween_out.interpolate_property(self, "rect_position:x", self.rect_position.x, self.rect_position.x - self.rect_size.x, 0.5)
	client_tween_out.start()
	isTwenIn = true

func _on_new_client(client: Resource) -> void:
	actual_client = client
	
	if !isTwenIn:
		twen_in()

func _on_ClientTweenOut_tween_completed(object, key) -> void:
	if actual_client:
		twen_in()

func _on_client_left() -> void:
	twen_out()
	actual_client = null

func _on_ClientTweenIn_tween_completed(object, key) -> void:
	dialog_manager.set_new_dialog()
	
func _on_end_day(_reason: String) -> void:
	isTwenIn = false
