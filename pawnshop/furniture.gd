extends TextureRect

export(String) var furniture_name
export(Array, Resource) var upgrades := []
export(int) var actual_upgrade = 0 setget set_upgrade, get_upgrade

enum State {REGULAR, UPGRADED, DESTROYED, FIXED}
export(State) var actual_state = 0 setget set_state, get_state

func _ready() -> void:
	refresh_image()

func refresh_image() -> void:
	texture = upgrades[actual_upgrade].get_actual_texture(actual_state)

func set_upgrade(upgrade: int) -> void:
	actual_upgrade = upgrade
	actual_state = 0
	refresh_image()
	
func get_upgrade() -> int:
	return actual_upgrade
	
func set_state(state: int) -> void:
	actual_state = state
	refresh_image()
	
func get_state() -> int:
	return actual_state

func upgrade() -> bool:
	if self.actual_state == State.REGULAR and player.take_money(upgrades[actual_upgrade].price):
		self.actual_state = State.UPGRADED
	elif self.actual_state == State.UPGRADED and player.take_money(upgrades[actual_upgrade+1].price):
		if is_upgrade_avaliable():
			self.actual_upgrade += 1
			
			if upgrades[actual_upgrade].regular == null:
				self.actual_state = State.UPGRADED
	
	if is_upgrade_avaliable():
		return true
	
	return false
	
func calculate_security() -> float:
	return upgrades[actual_upgrade].get_security(actual_state)
	
func calculate_apperance() -> float:
	return upgrades[actual_upgrade].get_apperance(actual_state)

func is_upgrade_avaliable() -> bool:
	return ( upgrades.size() - 1 == actual_upgrade and actual_state == State.REGULAR ) or upgrades.size() - 1 != actual_upgrade
