extends Node

signal stop

@export var creature: Sprite2D
@export var overlayImage: Sprite2D
@export var countdownTimer: Timer

@export var nameinput: TextEdit
@export var planetinput: TextEdit
@export var habitatinput: TextEdit
@export var dietinput: TextEdit

@export var Win: TextureRect
@export var gameOver: TextureRect

@export var count: int = 0
@export var canInterrogate: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	creature.texture = GameInfo.creatures[GameInfo.chosenPlanetPosition].image
	creature.texture = GameInfo.creatures[GameInfo.chosenPlanetPosition].habitatImage
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


func _on_button_pressed() -> void:
	var correct: int = 0
	
	if planetinput.text == GameInfo.creatures[GameInfo.chosenPlanetPosition].planetName:
		correct = correct + 1
	if habitatinput.text == GameInfo.creatures[GameInfo.chosenPlanetPosition].habitat:
		correct = correct + 1
	if dietinput.text == GameInfo.creatures[GameInfo.chosenPlanetPosition].diet:
		correct = correct + 1
		
	if correct >= 3:
		Win.visible = true
		GameInfo.addhappiness(40)
		emit_signal("stop")
	else:
		gameOver.visible = true
		GameInfo.removehappiness(20)
		emit_signal("stop")


func _on_win_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://_Scenes/ShipScene.tscn")


func _on_game_over_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://_Scenes/ShipScene.tscn")
