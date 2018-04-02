

extends KinematicBody2D

# Member variables
export var motion = Vector2()
export var cycle = 5.0
var accum = -20.0
#onready var ray  = get_node("platform/RayCast2D")
var pos = Vector2(1500,500)

func _physics_process(delta):
	accum += delta * (1.0 / cycle) * PI * 2.0
	accum = fmod(accum, PI * 2.0)
	var d = sin(accum)
	var xf = Transform2D(0,pos)
	xf[2]= motion * d 
	self.transform = xf
	

func _on_platform_body_entered(body):
	#print("player")
	pass
