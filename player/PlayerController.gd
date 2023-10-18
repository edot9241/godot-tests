extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var step_size = global_transform.basis.x.length() + global_transform.basis.x.length() / 3

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var x_axis_input = Input.get_axis("move_left", "move_right")

	print(x_axis_input)
	# if x_axis_input < 0:
	# 	var target_pos = Vector3(global_transform.basis.x.x - step_size, 0, 0)
	# 	var direction = global_position.direction_to(target_pos)
	# 	velocity = direction * SPEED
	# 	print("left")
	# elif x_axis_input > 0:
	# 	var target_pos = Vector3(global_transform.basis.x.x - step_size, 0, 0)
	# 	var direction = global_position.direction_to(target_pos)
	# 	velocity = direction * SPEED
	# 	print("right")

	move_and_slide()
