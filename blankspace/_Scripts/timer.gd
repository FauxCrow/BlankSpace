extends Node

@export var timer: Timer		
@export var currentTime: int		#in seconds

@export var stop: bool = false

@export var gameOver: TextureRect

func _ready() -> void:
	displayTime()

func _on_countdown_timer_timeout() -> void:
	currentTime = currentTime - 1
	displayTime()
	
	if currentTime <= 0:
		gameOver.visible = true
	elif stop == false:
		timer.start()
	else:
		pass

func displayTime() -> void:
	var minutes: int = int(floor(currentTime / 60))
	var seconds: int = currentTime - (60 * minutes)
	var formatStr: String = "%s:%s"
	self.text = formatStr % [minutes, seconds]


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://_Scenes/ShipScene.tscn")


func _on_capture_scene_stop() -> void:
	stop = true
	timer.stop()
	pass # Replace with function body.
