extends Node2D

const _cell_scene = preload("res://cell.tscn")

var CELL_WIDTH = 0
var CELL_HEIGHT = 0

const CELL_SPRITE_MARGIN = Vector2(3,3)

func _ready():
	var _window_size = get_viewport().size
	
	var cell = _cell_scene.instantiate()
	var cell_size = cell.get_node('Sprite').get_texture().get_size() * cell.get_node('Sprite').scale - CELL_SPRITE_MARGIN
	CELL_WIDTH = cell_size.x
	CELL_HEIGHT = 0.75 * cell_size.y
	# add center cell
	self.add_child(cell)
	
	# add surrounding cells
	for coord in _get_raw_neighbors(Vector2(0, 0)):
		var offset = int(abs(coord.y)) % 2
		cell = _cell_scene.instantiate()
		self.add_child(cell)
		var x = coord.x * CELL_WIDTH + (offset * (CELL_WIDTH / 2))
		var y = coord.y * CELL_HEIGHT
		cell.position = Vector2(x, y)
		
	# offset position to set maze in center
	self.position = Vector2(_window_size.x / 2, _window_size.y / 2)
	

# returns array of all possible neighbors
func _get_raw_neighbors(coord: Vector2) -> Array:
	var offset = int(coord.y) % 2
	
	return [
		Vector2(coord.x - 1 + offset, coord.y - 1),	# [0] top left
		Vector2(coord.x + offset, coord.y - 1),		# [1] top right
		Vector2(coord.x + 1, coord.y),				# [2] right
		Vector2(coord.x + offset, coord.y + 1),		# [3] bottom right
		Vector2(coord.x - 1 + offset, coord.y + 1),	# [4] bottom left
		Vector2(coord.x - 1, coord.y)				# [5] left
	]


func _process(delta):
	pass
