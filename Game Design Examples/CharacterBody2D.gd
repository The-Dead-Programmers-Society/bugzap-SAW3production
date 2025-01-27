extends CharacterBody2D


const SPEED = 300.0
const ROTATION = 100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	var rotation = Input.get_axis("ui_left","ui_right")
	
	if(rotation):
		transform = transform.rotated_local(rotation)
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * position.normalized().y * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
