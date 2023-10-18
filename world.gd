extends Node3D

var test_object = preload("res://test_object.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self._on_timeout)

func _on_timeout():
	_spawn_obstacle()

func _spawn_obstacle():
	var obj = test_object.instantiate()
	$Obstacles.add_child(obj)

	for child in $Obstacles.get_children():
		if child.position.z > $Camera3D.position.z:
			print("one fucker gone")
			$Obstacles.remove_child(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
