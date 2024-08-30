extends RigidBody2D

var center_of_map
var speed = 50.0
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	center_of_map = Vector2(DisplayServer.window_get_size() / 2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = (center_of_map - global_position).normalized()
	global_position += direction * speed * delta
