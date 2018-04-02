extends Node

onready var coin_scene = preload("res://Coin.tscn")
onready var coin_container = get_node("Coin_container")

func _ready():
	#var first_coin = coin_container.get_child(0)
	
	spawn_coins(3)
	set_process(true)
	pass

func spawn_coins(num):
	#array to hold positions fo coin_containers
	var postions = []
	postions.append(coin_container.position)
	#postions.append(coin_container_2.position)
	#postions.append(coin_container_3.position)
	#postions.append(coin_container_4.position)
	
	for pos in postions:
		for i in range(num):
			var coin = coin_scene.instance()
			coin.position = Vector2(pos.x+i*50,192)
			coin_container.add_child(coin)
			#yield(utils.create_timer(1),"timeout")
