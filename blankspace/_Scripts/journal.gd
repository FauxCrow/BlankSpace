# this script will take information from gameInfo (autoload) and create pages for the journal
extends Node

# stores all journal data
@export var creaturePages : int = ceil(len(GameInfo.entries) / 6.0)
@export var planetPages : int = len(GameInfo.planets)
@export var shapePages : int = ceil(len(GameInfo.shapes) / 9.0)
@export var totalPages : int

# stores all page layouts
@export var creaturePageLayout : Sprite2D
@export var planetPageLayout : Sprite2D
@export var shapePageLayout : Sprite2D

@export var currentPageNo : int = 0		# stores current page number
@export var currentPage : Sprite2D		# stores current page layout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	totalPages = creaturePages + planetPages + shapePages
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

# Called every page flip
func swapPage(isRight: bool) -> void:
	# guard clause - don't load if its already the first or last page
	if isRight && (currentPageNo + 1) <= totalPages:
		currentPageNo = currentPageNo + 1
	else:
		if (currentPageNo - 1) >= 0:
			currentPageNo = currentPageNo - 1
			
	loadPage()


# function to load a page when button is pressed
func loadPage() -> void:
	# remove current page
	currentPage.queue_free()
	
	# check what layout to load, and what info to include
	if currentPageNo <= creaturePages:
		currentPage = creaturePageLayout.instantiate()
		loadCreaturePage()
		
	elif currentPageNo <= creaturePages + planetPages:
		currentPage = planetPageLayout.instantiate()
		loadPlanetPage()
		
	else:
		currentPage = shapePageLayout.instantiate()
		loadShapePage()

# to access specific data in gameinfo:
# print(GameInfo.entries[0].name); #works

func loadCreaturePage() -> void:
	pass
	
func loadPlanetPage() -> void:
	pass
	
func loadShapePage() -> void:
	pass
