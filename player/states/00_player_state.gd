@icon("res://player/states/state_machine.svg")
class_name PlayerState extends Node

var player: Player
var next_state: PlayerState

#region /// state references
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall
#endregion

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
