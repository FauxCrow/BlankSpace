extends Node

@export var controlPanel: ColorRect
@export var energyBar: TextureProgressBar
@export var happinessBar: TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameInfo.happinessTimer.start()
	GameInfo.rechargeTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("(S2) ToggleDashboard"):
		controlPanel.visible = !controlPanel.visible
	
	energyBar.value = GameInfo.energy
	happinessBar.value = GameInfo.happiness
