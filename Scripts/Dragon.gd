# Dragon.gd
extends Area2D

const FIREBALL_SCENE = preload("res://Fireball.tscn")
const SPEED = 100



onready var timer = get_node("Timer")
onready var roar = get_node("Roar")

func _ready():
	#timer.set_active(false)
	timer.stop()
	set_process(true)




func _process(delta):
	
	
		#if sight.is_colliding():
			#print(sight.get_collider())
			#yield(utils.create_timer(2),"timeout")
			#create_fireball()
			#restart_timer()
			#yield(utils.create_timer(5),"timeout")
			pass

func create_fireball():
	var fireball = FIREBALL_SCENE.instance()
	get_parent().add_child(fireball)
	fireball.position = (get_node("Position2D").global_position)

func restart_timer():
	timer.wait_time = 0.5
	#timer.set_active(true)
	timer.start()

func _on_Timer_timeout():
	timer.stop()


func _on_Dragon_body_entered(body):
	if body.name == "Player":
		roar.play()
		yield(utils.create_timer(1),"timeout")
		get_tree().change_scene("GameOver.tscn")
