extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var step_size = 1
var is_moving = false
var root_pos = self.global_position.x

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	# todo: the z coordinate is the last pos, so when jumping and moving left and right we stuck at that pos
	var pos_x = self.global_position.x
	if event.is_action_pressed("move_right"):
		if pos_x == root_pos or pos_x == root_pos -step_size:
			self.global_position = Vector3(self.global_position.y + step_size, self.global_position.y, self.global_position.z) 
	elif event.is_action_pressed("move_left"):
		print("left")
		print(pos_x)
		print(root_pos)
		print(step_size)
		if pos_x == root_pos or pos_x == root_pos + step_size:	
			self.global_position = Vector3(self.global_position.y - step_size, self.global_position.y, self.global_position.z) 


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# if not Input.is_action_pressed("move_left") and is_moving or not Input.is_action_pressed("move_right") and is_moving:
	# 	is_moving = false

	move_and_slide()
