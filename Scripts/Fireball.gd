# Fireball.gd
extends Area2D

const FIREBALL_SPEED = 200
onready var player = get_parent().get_node("Player")
var speed_x = 1

func _ready():
	
	set_process(true)

func _process(delta):
	if player.Direction == "left" && !player.Firing:
		speed_x = -1
	
	var speed_y = 0
	var motion = Vector2(speed_x, speed_y) * FIREBALL_SPEED
	#set_pos(get_pos() + motion * delta)
	self.position += motion * delta 


func _on_VisibilityNotifier2D_exit_screen():
	queue_free()

func _on_Fireball_area_enter( area ):
	queue_free()
	area.queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	pass # replace with function body


func _on_Fireball_body_entered(body):
	pass


func _on_Fireball_area_entered(area):
	if area.name != "Player":
		queue_free()
		area.queue_free()
		print("Enemy Killed")
