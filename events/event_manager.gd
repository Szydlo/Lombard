extends Node

export(Dictionary) var events

func load_events() -> void:
	var dir := Directory.new()
	dir.open("res://events/events/")
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		
		if file == "":
			break
		elif not file.begins_with(".") and file.ends_with(".tres"):
			var res: Resource = load("res://events/events/" + file)
			events[res.name] = res
			
	dir.list_dir_end()

func _ready():
	load_events()

func init_event(event: String) -> void:
	var scene = events[event].scene.instance()
	get_node("/root/Node2D/Interface").add_child(scene)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		init_event("fine event")
