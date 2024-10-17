# this script will take information from gameInfo (autoload) and create pages for the journal
extends Node

# stores all journal data
@export var creaturePages : int = ceil(len(GameInfo.entries) / 6.0)
@export var planetPages : int = len(GameInfo.planets)
@export var shapePages : int = ceil(len(GameInfo.shapes) / 9.0)
@export var totalPages : int 		# stores maximum page no + 1

# stores all page layouts (visible / invisible)
@export var creaturePageLayout : Control
@export var planetPageLayout : Control
@export var shapePageLayout : Control

@export var currentPageNo : int = 0		# stores current page number
@export var currentPage : Control		# stores current page layout

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	totalPages = creaturePages + planetPages + shapePages
	loadPage()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

# Called every page flip
func swapPage(isRight: bool) -> void:
	# remove current page
	currentPage.visible = false
	currentPage = null
	
	# guard clause - don't load if its already the first or last page
	if isRight:
		if (currentPageNo + 1) < totalPages:
			currentPageNo = currentPageNo + 1
		else:
			currentPageNo = 0
	else:
		if (currentPageNo - 1) >= 0:
			currentPageNo = currentPageNo - 1
		else:
			currentPageNo = totalPages -1

	loadPage()


# function to load a page when button is pressed
func loadPage() -> void:
	# check what layout to load, and what info to include
	if currentPageNo < creaturePages:
		currentPage = creaturePageLayout
		loadCreaturePage()
		
	elif currentPageNo < creaturePages + planetPages:
		currentPage = planetPageLayout
		loadPlanetPage()
		
	else:
		currentPage = shapePageLayout
		loadShapePage()

# to access specific data in gameinfo:
# print(GameInfo.entries[0].name); #works

func loadCreaturePage() -> void:
	pass
	
func loadPlanetPage() -> void:
	var planetNo: int = currentPageNo - creaturePages + 1
	var image := planetPageLayout.get_node_or_null("planetImg") as TextureRect
	var code := planetPageLayout.get_node_or_null("planetCode") as Label
	var _name := planetPageLayout.get_node_or_null("planetName") as Label
	var description := planetPageLayout.get_node_or_null("planetDescription") as Label
	
	image = GameInfo.planets[planetNo].image
	code = GameInfo.planets[planetNo].planetCode
	_name = GameInfo.planets[planetNo].name
	description = GameInfo.planets[planetNo].description
	
func loadShapePage() -> void:
	pass
