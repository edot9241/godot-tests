extends Node3D

var obstacle = preload("res://obstacle.tscn")

func _ready():
	pass

func _process(_delta):
	pass

# Spawns a random obstacle in one of the randomly chosen child spawners.
func spawn_obstacle(node, deadzoneZ):
	var spawners = self.get_children()
	var spawner_index = randi_range(0, len(spawners) - 1)
	var spawner = spawners[spawner_index]

	var obj = obstacle.instantiate()
	obj.position = spawner.position
	node.add_child(obj)

	for child in node.get_children():
		if child.position.z > $Camera3D.position.z:
			$Obstacles.remove_child(child)
