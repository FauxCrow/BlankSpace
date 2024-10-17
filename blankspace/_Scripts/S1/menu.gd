extends Node

func _ready() -> void:
	GameInfo.isIdle = false
	pass # Replace with function body.

func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://_Scenes/ShipScene.tscn")

func _on_quit_btn_pressed() -> void:
	get_tree().quit()
