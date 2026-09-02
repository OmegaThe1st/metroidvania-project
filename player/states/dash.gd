class_name PlayerStateDash extends PlayerState

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
	return next_state

# what happens each physics_process tick in this state
func physics_process(_delta: float) -> PlayerState:
	return next_state
