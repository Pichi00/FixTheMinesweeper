extends KinematicBody2D

var input_vector = Vector2.ZERO
var speed = 300

func _ready():
	pass

func _physics_process(delta):
	input_vector.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_vector.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	if input_vector.y == 1:
		$AnimatedSprite.animation = "GoDown"
	elif input_vector.y == -1:
		$AnimatedSprite.animation = "GoUp"
	if input_vector.x == 1:
		$AnimatedSprite.animation = "GoRight"
	elif input_vector.x == -1:
		$AnimatedSprite.animation = "GoLeft"
	
	
	input_vector = input_vector.normalized()
	input_vector = move_and_slide(input_vector * speed)
