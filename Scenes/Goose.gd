extends KinematicBody2D

var speed = 200
var velocity = Vector2(1,0)
var goleft = false

func _ready():
	$AnimationPlayer.play("WalkRight")


func _on_Timer_timeout():
	velocity.x = -velocity.x
	goleft = !goleft
	if goleft:
		$AnimationPlayer.play("WalkLeft")
	else:
		$AnimationPlayer.play("WalkRight")
	

func _physics_process(_delta):
	move_and_slide(velocity*speed)
	
func stopwalk():
	speed = 0
