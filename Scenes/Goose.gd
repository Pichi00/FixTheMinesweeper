extends KinematicBody2D

var speed = 200
var velocity = Vector2(1,0)


func _on_Timer_timeout():
	velocity.x = -velocity.x
	$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h

func _physics_process(_delta):
	move_and_slide(velocity*speed)
