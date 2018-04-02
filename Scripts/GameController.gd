extends Node

onready var pause_menu_scene = preload("res://PauseMenu.tscn")
#var parent = get_tree().get_root()
onready var pause_menu = pause_menu_scene.instance()


func _ready():
	var node = pause_menu.get_tree().get_root()
	
	add_child(pause_menu)
	
	
func _physics_process(delta):	
	
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
		#$PauseMenu.show()
		node.show()

		
func _on_Button_pressed():
	get_tree().paused = false
	#$PauseMenu.hide()
	node.hide()