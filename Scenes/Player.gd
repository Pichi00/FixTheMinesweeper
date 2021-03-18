extends KinematicBody2D

var input_vector = Vector2.ZERO
var speed = 300

func _ready():
	pass

func _physics_process(delta):
	input_vector.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_vector.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	
	input_vector = input_vector.normalized()
	input_vector = move_and_slide(input_vector * speed)

func _input(event):
	if Input.is_action_pressed("ui_up"):
		$AnimationPlayer.play("Upside")
		$AnimatedSprite.animation = "GoUp"
	elif Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("Downside")
		$AnimatedSprite.animation = "GoDown"
	elif Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("Left")
		$AnimatedSprite.animation  = "GoSide"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimationPlayer.play("Right")
		$AnimatedSprite.animation = "GoSide"
		$AnimatedSprite.flip_h = false

func attack():
	pass
