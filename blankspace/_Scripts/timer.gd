extends Node

@export var timer: Timer		
@export var currentTime: int		#in seconds


func _on_countdown_timer_timeout() -> void:
	currentTime = currentTime - 1
	print(currentTime)
	if currentTime <= 0:
		print("game over")
	else:
		displayTime()
		timer.start()

func displayTime() -> void:
	var minutes: int = int(floor(currentTime / 60))
	var seconds: int = currentTime - (60 * minutes)
	var formatStr: String = "%s:%s"
	self.text = formatStr % [minutes, seconds]
