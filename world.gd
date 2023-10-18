extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self._on_timeout)

func _on_timeout():
	$Spawners.spawn_obstacle()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass