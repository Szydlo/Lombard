extends Sprite

export(int) var money = 0 setget set_money, get_money
signal money_change

func _ready() -> void:
	self.money = 0

func set_money(value: int) -> void:
	money = value
	emit_signal("money_change")

func get_money() -> int:
	return money

func take_money(amount: int) -> bool:
	if amount < money:
		self.money -= amount
		return true
	
	return false
