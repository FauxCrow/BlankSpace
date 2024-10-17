extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggleIcon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func toggleIcon() -> void:
	if GameInfo.newEntry == true:
		visible = true
	else:
		visible = false
