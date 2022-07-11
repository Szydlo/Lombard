extends Resource

export(String) var name = "default client"
export(Texture) var apperance
export(bool) var already_visited = false

export(float) var price_factor = 0.15

export(float) var max_anger = 3
export(float) var actual_anger = 0
export(float) var anger_factor = 0.5

export(float) var max_patience = 3
export(float) var actual_patience = 0
export(float) var patience_factor = 0.75

export(float) var max_compromise = 3
export(float) var actual_compromise = 0.25
export(float) var compromise_factor = 0.25

export(Resource) var selling_item
export(Resource) var wanted_item
export(String, FILE, "*.json") var dialog_json

var rng := RandomNumberGenerator.new()

func get_dialog() -> JSONParseResult:
	var file = File.new()
	
	if file.file_exists(dialog_json):
		file.open(dialog_json, file.READ)
	
	return parse_json(file.get_as_text())

func calculate_price(price: int) -> int:
	rng.randomize()
	return int(price +  rng.randi_range(-(price * price_factor), (price * price_factor)))

func calculate_min_price(price: int) -> int:
	return int(price - (price * actual_compromise))

func calculate_anger_price(price: int) -> int:
	price = calculate_min_price(price)
	return int(price - (price / 4))
	
func is_annoyed_enough() -> bool:
	return actual_patience > max_patience or actual_anger > max_anger
