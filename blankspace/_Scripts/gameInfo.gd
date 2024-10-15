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

# store player data
@export var energy: int = 100
@export var happiness: int = 100
