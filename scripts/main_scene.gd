extends Node2D

var objects := ["res://scenes/objects/cactus.tscn"]
@onready var objects_folder = $Objects
@onready var node_spawn = $NodeSpawn
@export var speed := 100

func _on_node_spawn_timeout():
	var x := randi() % objects.size()
	var object = ResourceLoader.load(objects[x]).instantiate()
	var sca := randi_range(0,3)
	objects_folder.add_child(object)
	object.position = Vector2(551,544 - sca)
	object.scale.y += sca - (sca)
	node_spawn.wait_time = randi_range(2,8)
