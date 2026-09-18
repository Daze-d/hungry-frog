extends Area2D

var fall_speed = 200.0


func _process(delta):
	position.y += fall_speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Frog":
		queue_free()
