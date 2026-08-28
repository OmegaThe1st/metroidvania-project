class_name Player extends CharacterBody2D


const SPEED = 300.0

func _process(delta: float) -> void:
	
	pass


func _physics_process(delta: float) -> void:
	velocity.x = 0
	
	if Input.is_action_pressed("left"):
		velocity.x = -100
	elif Input.is_action_pressed("right"):
		velocity.x = 100
	
	velocity.y = velocity.y + 980 * delta
	move_and_slide()
