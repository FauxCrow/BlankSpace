extends Resource

@export var image: Texture		# used to store journal image
@export var planetCode: String	# used to find creature for current planet
@export var name: String		# player decides
@export var planetName: String	# journal entry answer
@export var habitat: String		# journal entry answer
@export var diet: String		# journal entry answer
@export var happiness: bool 	# player decides -- should this be string or int or just a simple "is it happy?" where every answer is no LOL

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_image = null, p_planetCode = "", p_name = "", p_planetName = "", p_habitat = "", p_diet = "", p_happiness = true):
	image = p_image
	planetCode = p_planetCode
	name = p_name
	planetName = p_planetName
	habitat = p_habitat
	diet = p_diet
	happiness = p_happiness
