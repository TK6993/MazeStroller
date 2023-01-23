extends Node


	

signal directionSignal(direction: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_processButtonInput()
	pass

# process any Button Input
func  _processButtonInput():

	if Input.is_action_pressed("ui_left"):		_onPressedDirection(Vector2.LEFT)
	if Input.is_action_pressed("ui_right"):		_onPressedDirection(Vector2.RIGHT)
	if Input.is_action_pressed("ui_down"):		_onPressedDirection(Vector2.DOWN)
	if Input.is_action_pressed("ui_up"):		_onPressedDirection(Vector2.UP)

func _onPressedDirection(direction: Vector2):
	directionSignal.emit(direction)
