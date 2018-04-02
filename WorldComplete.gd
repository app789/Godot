extends Area2D

#export (String, FILE, "*.tscn") var world_scene
export var next_scene = ""

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			print("HAA!")
			get_tree().change_scene(next_scene)

