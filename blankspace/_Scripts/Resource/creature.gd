extends Resource

@export var image: Texture			# used to input journal / observation mode image
@export var habitatImage: Texture	# used to store interrogation mode image
@export var planetCode: String		# used to find creature for current planet
@export var name: String			# backend name for identification
@export var planetName: String		# used to match journal entry answer
@export var habitat: String			# used to match journal entry answer
@export var diet: String			# used to match journal entry answer

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_image = null, p_habitatImage = null, p_planetCode = "", p_name = "", p_planetName = "", p_habitat = "", p_diet = ""):
	image = p_image
	habitatImage = p_habitatImage
	planetCode = p_planetCode
	name = p_name
	planetName = p_planetName
	habitat = p_habitat
	diet = p_diet
