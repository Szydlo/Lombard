extends CanvasLayer

onready var money_label := $MoneyLabel
onready var day_label := $DayLabel

onready var pawn_shop_scene = preload("res://pawnshop/pawnshop_settings.tscn")

func _ready() -> void:
	var _value := player.connect("money_change", self, "_on_money_change")
	_value = day_manager.connect("new_day", self, "_on_day_change")
	
	gamemode.start_game()
	
func _on_money_change() -> void:
	money_label.text = "$" + str(player.money)

func _on_day_change(day: int) -> void:
	day_label.text = "Dzien: " + str(day)

func _on_PawnshopButton_pressed() -> void:
	var scene: Control = pawn_shop_scene.instance()
	add_child(scene)
