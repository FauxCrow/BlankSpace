# This script is autoloaded -- can be accessed by any script
extends Node

# stores all planet information through resources
@export var planets: Array[Resource]

# stores all creature information through resources
@export var creatures: Array[Resource]

# stores all shape information through resources
@export var shapes: Array[Resource]

# stores all journal entry information through resources
@export var entries: Array[Resource]

# store input data
@export var chosenPlanetPosition: int

# store player data
@export var energy: int = 100
@export var happiness: int = 100

# store timers for player data 
@export var happinessTimer: Timer
@export var rechargeTimer: Timer
@export var isIdle: bool = true		# only start change values when in ship scene

# stores journal updates
@export var newEntry: bool = true
		
func addhappiness(value: int) -> void:
	happiness = happiness + value
	
	if (happiness > 100):
		happiness = 100
		

func useEnergy(value: int) -> void:
	energy = energy - value
	
	if (happiness > 0):
		rechargeTimer.start()
	else:
		emit_signal("gameOver")


func _on_happiness_timer_timeout() -> void:
	happiness = happiness - 1
	
	if happiness <= 0:
		emit_signal("gameOver")	
	elif happiness > 0 && isIdle:
		happinessTimer.start()


func _on_recharge_t_imer_timeout() -> void:
	energy = energy + 1
	
	if energy > 100:
		energy = 100
	
	if isIdle:
		rechargeTimer.start()
