extends Node

@export var controlPanel: ColorRect
@export var energyBar: TextureProgressBar
@export var happinessBar: TextureProgressBar
@export var happinessIcon: TextureRect

@export var happyIcons: Array[Texture]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameInfo.happinessTimer.start()
	GameInfo.rechargeTimer.start()
	
	happyIcons.append(load("res://_UI/Sprites/happyIcon1.png"))
	happyIcons.append(load("res://_UI/Sprites/neutralIcon2.png"))
	happyIcons.append(load("res://_UI/Sprites/angryIcon3.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("(S2) ToggleDashboard"):
		controlPanel.visible = !controlPanel.visible
	
	energyBar.set_value_no_signal(GameInfo.energy)
	happinessBar.set_value_no_signal(GameInfo.happiness)
	
	if happinessBar.value > 80:
		happinessIcon.texture = happyIcons[0]
	elif happinessBar.value > 20:
		happinessIcon.texture = happyIcons[1]
	else:
		happinessIcon.texture = happyIcons[2]
