extends Area2D

var fall_speed = 100.0


func _process(delta):
	position.y += fall_speed * delta

	if position.y > get_viewport_rect().size.y:
		queue_free()
