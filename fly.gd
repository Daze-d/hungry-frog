extends Area2D

var fall_speed = 150.0


func _process(delta):
	position.y += fall_speed * delta


func _on_body_entered(body):
	if body.name == "Frog":
		queue_free()
