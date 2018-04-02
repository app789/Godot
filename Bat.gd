extends Area2D

# class member variables go here, for example:
# var a = 2
var velocity = Vector2(10,0)

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(-velocity * delta)
	$AnimatedSprite.play("attack")
	pass


func _on_KinematicBody2D_body_entered(body):
	if body.name == "Player":
			get_tree().change_scene("GameOver.tscn")
			print("game Over")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
