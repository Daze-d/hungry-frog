extends Node2D

var fly_scene = preload("res://fly.tscn")


func _on_fly_timer_timeout() -> void:
	var fly = fly_scene.instantiate()

	var screen_width = get_viewport_rect().size.x

	fly.position.x = randf_range(40, screen_width - 40)
	fly.position.y = 0

	add_child(fly)
