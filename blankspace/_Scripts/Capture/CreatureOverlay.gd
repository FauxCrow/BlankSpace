extends Node

@export var creature: Sprite2D
@export var overlayImage: Sprite2D
@export var countdownTimer: Timer

@export var count: int = 0
@export var canInterrogate: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canInterrogate && Input.is_action_just_pressed("(S3) ToggleCam"):
		print("Space Bar Pressed " + str(count))
		toggleImage()
		

# checks which image to show
func toggleImage() -> void:
	if count % 2 == 0:
		creature.visible = false
		overlayImage.visible = true
	else:
		overlayImage.visible = false
		creature.visible = true
		resetTimer()
		
	count = count + 1

# sets cooldown of 5 seconds after exiting interrogation mode before you can use it again
func resetTimer() -> void:
	canInterrogate = false;
	countdownTimer.start(5)


func _on_cooldown_timer_timeout() -> void:
	canInterrogate = true;
