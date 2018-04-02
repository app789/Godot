extends AudioStreamPlayer2D

#onready var sfx = get_node("AudioStreamPlayer2D")

func _ready():
	#print ("HAHAHAHAHAHHA")
	play(0)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_tree().change_scene("MainMenu.tscn")
