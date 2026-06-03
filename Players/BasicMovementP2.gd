extends CharacterBody2D

var health = 1
const SPEED = 600.0
const JUMP_VELOCITY = -670.0

var jump_buffer_time: float = 0.15
var coyote_time: float = 0.1
var jump_buffer_counter: float = 0.0
var coyote_counter: float = 0.0

func p2_damage() -> void:
	health = 0
	$AnimatedSprite2D.play("hurt")
	GameManager.game_over()
	
func _physics_process(delta: float) -> void:
	if is_on_floor():
		coyote_counter = coyote_time
	else:
		coyote_counter -= delta
		
	if Input.is_action_just_pressed("p2jump"):
		jump_buffer_counter = jump_buffer_time
	else:
		jump_buffer_counter -= delta
		
	if not is_on_floor():	
		velocity += get_gravity() * delta * 1.4
	
	if health > 0:
		if jump_buffer_counter > 0.0 and coyote_counter > 0.0 and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("p2left", "p2right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		if is_on_floor():
			if direction == 0:
				$AnimatedSprite2D.play("idle")
			else:
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("run")
			
		if direction > 0:
			$AnimatedSprite2D.flip_h = false
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
			
	
	move_and_slide()
