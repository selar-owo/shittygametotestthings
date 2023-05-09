extends CharacterBody2D

@onready var main_scene = $"../.."

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	velocity.x -= main_scene.speed
	move_and_slide()
