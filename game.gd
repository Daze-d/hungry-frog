extends Node2D

var fly_scene = preload("res://fly.tscn")
var butterfly_scene = preload("res://butterfly.tscn")

func _on_fly_timer_timeout() -> void:
	var fly = fly_scene.instantiate()

	fly.position.x = randf_range(50, 310)
	fly.position.y = 0

	add_child(fly)


func _on_butterfly_timer_timeout() -> void:
	var butterfly = butterfly_scene.instantiate()

	butterfly.position.x = randf_range(50, 310)
	butterfly.position.y = 0

	add_child(butterfly)
