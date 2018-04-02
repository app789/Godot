extends Node

onready var coin_scene = preload("res://Coin.tscn")
onready var square = preload("res://Square.tscn")
onready var coin_container = get_node("Coin_container")
onready var coin_container_2 = get_node("Coin_container2")
onready var coin_container_3 = get_node("Coin_container3")
onready var coin_container_4 = get_node("Coin_container4")
#onready var platform_container = get_node("PlatformContainer")

var coins_collected = 0
var timer = 0.0
var platform_spawn_delay = 5.0


func _ready():
	#var first_coin = coin_container.get_child(0)
	
	spawn_coins(3)
	set_process(true)
	set_physics_process(true)

func spawn_coins(num):
	#array to hold positions fo coin_containers
	var postions = []
	postions.append(coin_container.position)
	postions.append(coin_container_2.position)
	postions.append(coin_container_3.position)
	postions.append(coin_container_4.position)
	
	for pos in postions:
		for i in range(num):
			var coin = coin_scene.instance()
			coin.position = Vector2(pos.x+i*50,192)
			coin_container.add_child(coin)
			#yield(utils.create_timer(1),"timeout")
			
		
	
#func spawn_platform():
#	var square_platform = square.instance()
#	platform_container.add_child(square_platform)
#	square_platform.position = (platform_container.get_node("Position2D").global_position)

func _physics_process(delta):
	if(timer >= platform_spawn_delay):
		timer -= platform_spawn_delay
		#spawn_platform()
	timer += delta
	
	
