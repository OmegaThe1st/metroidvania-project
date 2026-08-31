class_name PlayerStateRun extends PlayerState

func init() -> void:
	pass
	
func enter() -> void:
	player.animated_sprite_2d.play("run")

func exit() -> void:
	pass

# handles what happens when an input is pressed or unpressed
func handle_input(_event: InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		return jump
	elif _event.is_action_pressed("down"):
		return crouch
	return next_state

# what happens each process tick in this state
func process(_delta: float) -> PlayerState:
	if player.direction.x == 0:
		return idle
	elif player.velocity.y > 0:
		return fall
	return next_state

# what happens each physics_process tick in this state
func physics_process(_delta: float) -> PlayerState:
	player.velocity.x = player.direction.x * player.SPEED
	return next_state
