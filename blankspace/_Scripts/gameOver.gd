extends TextureRect

signal my_signal

@export var signalObj: Callable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("my_signal", signalObj, "my_method")

func my_method():
	pass
