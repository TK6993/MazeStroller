extends Node

var _speed: float = 109

# the _currentDirection is NOT normelised
var _currentDirection: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	#InputManager.connect("directionSignal",self,"_setDirection")
	InputManager.directionSignal.connect(_setDirection)
	pass # Replace with function body.


	
func _setDirection(value: Vector2):
	_currentDirection += value
	_currentDirection = _currentDirection.normalized()

	
func _getMoveVector() -> Vector2:
	
	return _currentDirection * _speed

		
func update(player: CharacterBody2D):
	player.velocity = _getMoveVector();
	player.move_and_slide()
	print("the current Direction is: ", player.velocity.length())
	_currentDirection = Vector2.ZERO
	
	
