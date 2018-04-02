
extends KinematicBody2D


const UP = Vector2(0,-1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -500
var Direction = "right"
var Firing = false

var motion = Vector2()
var audio = Thread.new()

const FIREBALL_SCENE = preload("res://Fireball.tscn")
const SPEED = 100
onready var timer = get_node("Timer")
onready var potti = get_node("GameOverSound")
onready var ray = get_node("DeathRay")


func _ready():
	#timer.set_active(false)
	timer.stop()
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		#if timer.is_stopped():
			Firing = true
			print ("Firing")
			create_fireball()
			#restart_timer()
	if(ray.is_colliding()):
		var collider = ray.get_collider()
		#print(collider)

func create_fireball():
	var fireball = FIREBALL_SCENE.instance()
	get_parent().add_child(fireball)
	fireball.position = (get_node("Position2D").global_position)
	Firing = false

func restart_timer():
	timer.wait_time = 0.5
	#timer.set_active(true)
	timer.start()

func _on_Timer_timeout():
	timer.stop()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	

	
	if(Input.is_action_pressed("ui_right")):
		Direction = "right"
		motion.x = min(motion.x + ACCELERATION,MAX_SPEED)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Run")
	elif(Input.is_action_pressed("ui_left")):
		Direction = "left"
		motion.x = max(motion.x - ACCELERATION,-MAX_SPEED)
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
	else:
		$AnimatedSprite.play("Idle")
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$AnimatedSprite.play("Jump")
		else:
			$AnimatedSprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		$PauseMenu.show()
	motion = move_and_slide(motion,UP)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass






func _on_Button_pressed():
	get_tree().paused = false
	print("Resume")
	$PauseMenu.hide()


func _on_Shredder_body_entered(body):
		audio.start(potti,"PlayAudio")
		#yield(utils.create_timer(2.5),"timeout")
		get_tree().change_scene("GameOver.tscn")
		print ("HELL")
		
func PlayAudio():
	potti.play(0)




