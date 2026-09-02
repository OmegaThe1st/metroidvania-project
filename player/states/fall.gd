class_name PlayerStateFall extends PlayerState

@export var coyote_time: float = .125
@export var buffer_time: float = .2
@export var crouch_buffer_time: float = .4

var coyote_timer: float
var buffer_timer: float
var crouch_buffer_timer: float
var fall_gravity: float = 1.165

func init() -> void:
	pass
	
func enter() -> void:
	player.animation_player.play("fall")
	player.gravity_multiplier = fall_gravity
	
	if player.previous_state == jump:
		coyote_timer = 0
	else:
		coyote_timer = coyote_time


func exit() -> void:
	player.gravity_multiplier = 1.0
	buffer_timer = 0
	crouch_buffer_timer = 0
	pass

# handles what happens when an input is pressed or unpressed
func handle_input(_event: InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		if coyote_timer > 0:
			return jump
		else:
			buffer_timer = buffer_time
	elif _event.is_action_pressed("down"):
		crouch_buffer_timer = crouch_buffer_time
	return next_state

# what happens each process tick in this state
func process(_delta: float) -> PlayerState:
	coyote_timer -= _delta
	buffer_timer -= _delta
	crouch_buffer_timer -= _delta
	return next_state

# what happens each physics_process tick in this state
func physics_process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		if buffer_timer > 0:
			return jump
		elif crouch_buffer_timer > 0:
			return crouch
		return idle
	
	# glide in air
	player.velocity.x = player.SPEED * player.direction.x
	return next_state
