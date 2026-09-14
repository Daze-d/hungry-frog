extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

var hop_distance = 60.0
var hop_height = 25.0
var hop_time = 0.3

var left_limit = 25.0
var right_limit = 335.0

var hopping = false
var start_position = Vector2.ZERO
var target_position = Vector2.ZERO
var hop_progress = 0.0

func _physics_process(delta):
	if hopping:
		update_hop(delta)
	else:
		check_for_hop()

func check_for_hop():
	var direction = Input.get_axis("move_left", "move_right")

	if direction == 0:
		sprite.play("idle")
		return

	direction = sign(direction)

	sprite.flip_h = direction > 0
	
	start_position = position
	target_position = position + Vector2(direction * hop_distance, 0)
	
	# Don't allow the target to leave the screen
	target_position.x = clamp(target_position.x, left_limit, right_limit)
	
	hop_progress = 0.0
	hopping = true
	sprite.play("jump")

func update_hop(delta):
	hop_progress += delta / hop_time
	
	var t = clamp(hop_progress, 0.0, 1.0)
	
	position.x = lerp(start_position.x, target_position.x, t)
	
	var arc = sin(t * PI)
	position.y = start_position.y - arc * hop_height
	
	if t < 0.5:
		sprite.play("jump")
	else:
		sprite.play("fall")
		
	if t >= 1.0:
		position = target_position
		hopping = false
		sprite.play("land")
		
