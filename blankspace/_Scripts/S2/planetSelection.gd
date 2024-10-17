extends Node

# store reference to input string
@export var input: LineEdit

# stores planet codes from gameInfo
@export var planetCodes: Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in GameInfo.planets:
		planetCodes.append(i.planetCode)

# sets the planet destination if right code given, if not, choose a random planet
func _on_enter_btn_pressed() -> void:
	var isCorrect: bool = false #temp variable
	
	var codeAttempt = input.text
	for i in range(0, len(planetCodes)):
		if codeAttempt == planetCodes[i]:
			GameInfo.chosenPlanetPosition = i
			isCorrect = true
	
	if !isCorrect:
		GameInfo.chosenPlanetPosition = randi_range(0,4)
	
	# change scene to radar scene
	get_tree().change_scene_to_file("res://_Scenes/RadarScene.tscn")
