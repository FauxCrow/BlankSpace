extends Resource

@export var image: Texture		# journal shape image
@export var description: String	# journal shape description (e.g. "looks like vegetation")

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_image = null, p_description = ""):
	image = p_image
	description = p_description
