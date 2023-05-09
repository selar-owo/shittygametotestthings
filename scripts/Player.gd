extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation_player = $AnimationPlayer
@onready var main_scene = $".."
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.seek(0.0,true)
		animation_player.play("jump]")
	
	if Input.is_action_pressed("slide") and is_on_floor():
		main_scene.speed = 200
		sprite_2d.position = Vector2(randf_range(-5,5),randf_range(-5,5))
	if Input.is_action_just_released("slide") or !is_on_floor():
		main_scene.speed = 100
		sprite_2d.position = Vector2(0,0)
	
	move_and_slide()

func kill():
	get_tree().quit()
