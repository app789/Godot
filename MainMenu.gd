extends MarginContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_tree().change_scene("Game.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_Instructions_pressed():
	get_tree().change_scene("Instructions.tscn")