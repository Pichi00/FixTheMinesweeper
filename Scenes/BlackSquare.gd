extends Node2D

var dragging = false
var offset : Vector2
var is_mouse_in_bar = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && is_mouse_in_bar && visible:
			offset = Vector2( get_local_mouse_position().distance_to( self.position ) * cos(rotation),
                get_local_mouse_position().distance_to( self.position ) * sin(rotation) )
			if( get_local_mouse_position().x < self.position.x ):
				offset = Vector2( offset.x * -1, offset.y )
			if( get_local_mouse_position().y < self.position.y ):
				offset = Vector2( offset.x, offset.y * -1)
			offset = get_local_mouse_position()
			dragging = event.pressed
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			dragging = false
	visible = $"/root/Desktop/Terminal".visible


func _physics_process(delta: float) -> void:
	if dragging:
		var new_position = get_viewport().get_mouse_position() - offset
		translate( new_position - position)
		position.x = clamp(position.x,0,get_viewport_rect().size.x-80)
		position.y = clamp(position.y,0,get_viewport_rect().size.y-80)
	if get_local_mouse_position().x < ($TopWindowBar/CollisionShape2D.position.x + $TopWindowBar/CollisionShape2D.shape.extents.x)&& get_local_mouse_position().x > ($TopWindowBar/CollisionShape2D.position.x - $TopWindowBar/CollisionShape2D.shape.extents.x)&& get_local_mouse_position().y > ($TopWindowBar/CollisionShape2D.position.y - $TopWindowBar/CollisionShape2D.shape.extents.y)&& get_local_mouse_position().y < ($TopWindowBar/CollisionShape2D.position.y + $TopWindowBar/CollisionShape2D.shape.extents.y):
		is_mouse_in_bar = true
	else:
		is_mouse_in_bar = false
