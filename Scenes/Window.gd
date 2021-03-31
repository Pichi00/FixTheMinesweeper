extends Node2D

var dragging = false
var offset : Vector2

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT:
            print( "Mouse Position: " +
                str( get_local_mouse_position() ) +
                "\nDistance to Middle of platform: " +
                str( get_local_mouse_position().distance_to( self.position ) ) ) 

            offset = Vector2( get_local_mouse_position().distance_to( self.position ) * cos(rotation),
                get_local_mouse_position().distance_to( self.position ) * sin(rotation) )
            if( get_local_mouse_position().x < self.position.x ):
                offset = Vector2( offset.x * -1, offset.y )
            if( get_local_mouse_position().y < self.position.y ):
                offset = Vector2( offset.x, offset.y * -1)

            offset = get_local_mouse_position()
            dragging = event.pressed

func _input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.button_index == BUTTON_LEFT and !event.pressed:
            dragging = false


func _physics_process(delta: float) -> void:
	if dragging:
		var new_position = get_viewport().get_mouse_position() - offset
		translate( new_position - position)
		position.x = clamp(position.x,0,get_viewport_rect().size.x-80)
		position.y = clamp(position.y,0,get_viewport_rect().size.y-80)
