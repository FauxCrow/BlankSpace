extends Node2D

@export var map: Node2D

func _on_up_pressed() -> void:
	map.position += Vector2 (0,100)


func _on_down_pressed() -> void:
	map.position += Vector2 (0,-100)
	

func _on_left_pressed() -> void:
	map.position += Vector2 (100,0)


func _on_right_pressed() -> void:
	map.position += Vector2 (-100,0)
	
	
