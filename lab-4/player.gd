extends CharacterBody3D


@export var speed = 5.0
@export var jump_force = 10.0
@export var gravity = 9.8

func _physics_process(delta):
	# Get input for movement
	var direction = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	# Normalize direction and move
	direction = direction.normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		# Jumping
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_force

	# Move the player
	move_and_slide()
