extends KinematicBody2D

var gravity = 0
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity
	move_and_slide(velocity)

func change_gravity():
	gravity = 20
