class_name Player extends CharacterBody2D

#region Export Variables
@export var SPEED: float = 150.0

#endregion

#region State Machine Variables
var states: Array[PlayerState]
var current_state: PlayerState:
	get: return states.front()
var previous_state: PlayerState:
	get: return states[1]
#endregion

#region Standard Variables
var direction: Vector2 = Vector2(0, 0)
var last_direction: Vector2
var gravity: float = 980

#endregion


func _ready() -> void:
	initialize_states()
	pass


func _process(_delta: float) -> void:
	update_direction()
	change_state(current_state.process(_delta))
	pass


func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))


func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * _delta
	move_and_slide()
	change_state(current_state.physics_process(_delta))


func initialize_states() -> void:
	states = []
	# gather all states
	
	for c in $States.get_children():
		if c is PlayerState:
			states.append(c)
			c.player = self
	
	if states.size() == 0:
		print("x")
		return
	
	# intialize all states
	for state in states:
		state.init()
	
	# set our first state
	change_state(current_state)
	current_state.enter()
	$"State Indicator".text = current_state.name
	
func change_state(new_state: PlayerState) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
	
	if current_state:
		current_state.exit()
	
	states.push_front(new_state)
	current_state.enter()
	states.resize(3)
	$"State Indicator".text = current_state.name
	pass

func update_direction() -> void:
	# var prev_direction: Vector2 = direction
	direction = Input.get_vector("left", "right", "up", "down")
	pass
