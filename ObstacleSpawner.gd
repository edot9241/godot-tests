extends Node3D

var obstacle = preload("res://obstacle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Spawns a random obstacle in one of the randomly chosen positions.
func spawn_obstacle(node, dead_zone_z):
	var positions = self.get_children()
	var pos = positions[randi_range(0, len(spawners) - 1)].position

	var obj = obstacle.instantiate()
	obj.position = spawner.position
	node.add_child(obj)

	for child in node.get_children():
		if child.position.z > $Camera3D.position.z:
			$Obstacles.remove_child(child)
