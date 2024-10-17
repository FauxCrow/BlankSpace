extends Node

@export var noise_height_texture: NoiseTexture2D
var noise: Noise

@export var tilemap: TileMapLayer

var width: int = 100
var height: int = 100

var source: int = 0
var x_value: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise = noise_height_texture.noise
	# x_value = GameInfo.chosenPlanetPosition
	x_value = 0
	generate_world()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func generate_world() -> void:
	for x in range(width):
		for y in range(height):
			var noise_val = noise.get_noise_2d(x,y)

			if noise_val > 0.6:
				tilemap.set_cell(Vector2i(x,y), source, Vector2i(x_value, 0))
			elif noise_val >=0:
				tilemap.set_cell(Vector2i(x,y), source, Vector2i(x_value, 1))
			elif noise_val < 0:
				tilemap.set_cell(Vector2i(x,y), source, Vector2i(x_value, 2))
				pass
