extends Resource
class_name Upgrades

export(String) var name = "default"
export(Texture) var regular
export(Texture) var upgraded
export(Texture) var destroyed
export(Texture) var fixed

export(int) var price

enum State {REGULAR, UPGRADED, DESTROYED, FIXED}

export(float) var regular_apperance_factor = 0
export(float) var regular_security_factor = 0

export(float) var upgraded_apperance_factor = 1
export(float) var upgraded_security_factor = 1

func get_actual_texture(actual_state: int) -> Texture:
	match actual_state:
		State.REGULAR:
			return regular
		State.UPGRADED:
			return upgraded
		State.DESTROYED:
			return destroyed
		State.FIXED:
			return fixed
			
	return null
	
func get_security(actual_state: int) -> float:
	if actual_state == State.UPGRADED:
		return upgraded_security_factor
		
	return regular_security_factor
	
func get_apperance(actual_state: int) -> float:
	if actual_state == State.UPGRADED:
		return upgraded_apperance_factor
		
	return regular_apperance_factor
