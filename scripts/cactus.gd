extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	velocity.x -= 100
	move_and_slide()
