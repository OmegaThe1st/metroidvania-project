class_name PlayerStateFall extends PlayerState

func init() -> void:
	pass
	
func enter() -> void:
	pass


func exit() -> void:
	pass

# handles what happens when an input is pressed or unpressed
func handle_input(_event: InputEvent) -> PlayerState:
	return next_state

# what happens each process tick in this state
func process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		return idle
	
	return next_state

# what happens each physics_process tick in this state
func physics_process(_delta: float) -> PlayerState:
	# glide in air
	player.velocity.x = player.SPEED * player.direction.x
	return next_state
