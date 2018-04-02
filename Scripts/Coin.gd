extends Node2D

onready var AudioPlayer = get_node("AudioStreamPlayer2D")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#self.set_pos
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass





func _on_Area2D_body_entered(body):
	if(body.get_name() == "Player"):
		#get_parent().get_parent().coins_collected += 1
		#print("music")
		AudioPlayer.play(0)
		yield(utils.create_timer(0.1),"timeout")
		queue_free()
	#get_parent().get_parent().get_node("CoinCount").set_text(str(get_parent().get_parent().coins_collected))
