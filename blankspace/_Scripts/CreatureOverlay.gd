extends Node
var count: int = 0
var creature: Sprite2D
var overlayImage: Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	creature = $Creature
	creature.visible = false
	overlayImage = $Overlay
	overlayImage.visible = false
	if count % 2 == 0 and Input.is_action_just_pressed("ToggleInterrogation"):
		print("Space Bar Pressed {count}")
		overlayImage.visible = true
	
	elif count % 2 != 0 and Input.is_action_just_pressed("ToggleInterrogation"):
		print("Space Bar Pressed {count}")
		creature.visible = true
		
	else:
		pass
		
		
		
		
