extends Resource

@export var image: Texture		# journal image
@export var planetCode: String	# used to match creature to current planet
@export var name: String		# journal planet name
@export var description: String	# journal planet description

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_image = null, p_planetCode = "", p_name = "", p_description = ""):
	image = p_image
	planetCode = p_planetCode
	name = p_name
	description = p_description
