extends Node

var _speed: float = 109
var _isMoving
# the _currentDirection is NOT normelised
var _currentDirection: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	#InputManager.connect("directionSignal",self,"_setDirection")
	InputManager.directionSignal.connect(_setDirection)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _setDirection(value: Vector2):
	_currentDirection += value

	
func _getMoveVector() -> Vector2:
	
	return _currentDirection.normalized() * _speed

		
func update(player: CharacterBody2D):
	player.velocity = _getMoveVector();
	player.move_and_slide()
	print("the current Direction is: ", player.velocity.length())
	_currentDirection = Vector2.ZERO
	
	
