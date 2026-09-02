class_name PlayerStateCrouch extends PlayerState

@export var deceleration_rate: float = 20

func init() -> void:
	pass
	
func enter() -> void:
	player.animation_player.play("crouch")
	player.stand.disabled = true
	player.crouch.disabled = false
	
	# shift camera
	player.shape_cast_2d.force_shapecast_update()
	if player.shape_cast_2d.is_colliding() == false:
		player.shift_camera(200)

func exit() -> void:
	player.stand.disabled = false
	player.crouch.disabled = true
	
	# reset camera
	player.camera_2d.position.y = player.CAMERA_Y

# handles what happens when an input is pressed or unpressed
func handle_input(_event: InputEvent) -> PlayerState:
	if _event.is_action_released("down"):
		return idle
	elif _event.is_action_pressed("jump"):
		if player.shape_cast_2d.is_colliding() == true:
			player.position.y += 4
			return fall
		else:
			return jump
	return next_state
# what happens each process tick in this state
func process(_delta: float) -> PlayerState:
	return next_state

# what happens each physics_process tick in this state
func physics_process(_delta: float) -> PlayerState:
	player.velocity.x -= player.velocity.x * deceleration_rate * _delta
	return next_state
