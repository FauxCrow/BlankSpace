extends Node

@export var currentPlanet: Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentPlanet = GameInfo.planets[GameInfo.chosenPlanetPosition]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
