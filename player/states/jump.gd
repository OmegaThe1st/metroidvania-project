class_name PlayerStateJump extends PlayerState

@export var JUMP_VELOCITY: float = -450.0
@export var GLIDE_SPEED: float = 50.0

func init() -> void:
	pass
	
func enter() -> void:
	player.animation_player.play("jump")
	player.velocity.y = JUMP_VELOCITY
	
	if player.previous_state == fall and not Input.is_action_pressed("jump"):
		await get_tree().physics_frame
		player.velocity.y *= .5
		player.change_state(fall)

func exit() -> void:
	pass

# handles what happens when an input is pressed or unpressed
func handle_input(_event: InputEvent) -> PlayerState:
	if _event.is_action_released("jump"):
		player.velocity.y *= .5
		return fall
	return next_state

# what happens each process tick in this state
func process(_delta: float) -> PlayerState:
	if player.velocity.y >= 0:
		return fall
	return next_state

# what happens each physics_process tick in this state
func physics_process(_delta: float) -> PlayerState:
	# glide in air
	player.velocity.x = player.SPEED * player.direction.x
	return next_state
