extends CharacterBody2D

var direction = 1
var speed = 140
var is_attacking = false
var is_dead = false

var color: int = randi_range(1, 3)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_wall():
		direction *= -1
	
	if not is_attacking and not is_dead:
		if color == 1:
			$AnimatedSprite2D.play("idleRed")
		elif color == 2:
			$AnimatedSprite2D.play("idlePurple")
		elif color == 3:
			$AnimatedSprite2D.play("idleYellow")
		
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	elif is_attacking:
		if color == 1:
			$AnimatedSprite2D.play("attackRed")
		elif color == 2:
			$AnimatedSprite2D.play("attackPurple")
		elif color == 3:
			$AnimatedSprite2D.play("attackYellow")
		velocity.x = 0
	elif is_dead:
		if color == 1:
			$AnimatedSprite2D.play("deathRed")
		elif color == 2:
			$AnimatedSprite2D.play("deathPurple")
		elif color == 3:
			$AnimatedSprite2D.play("deathYellow")
		velocity.x = 0
		
	move_and_slide()
	
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
	
func _on_head_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Player2":
		if body.velocity.y > 0:
			if not is_dead:
				body.velocity.y = -400
			is_dead = true
			velocity.x = 0
			await get_tree().create_timer(0.6, true, false, true).timeout 
			queue_free()
		
func _on_body_body_entered(body: Node2D) -> void:
	if not is_dead:
		if body.name == "Player":
			if body.velocity.y <= 0:
				is_attacking = true
				body.p1_damage()
		elif body.name == "Player2":
			is_attacking = true
			if body.velocity.y <= 0:
				body.p2_damage()
			
