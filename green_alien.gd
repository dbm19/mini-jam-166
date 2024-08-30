extends RigidBody2D

var center_of_map
var speed = 100.0
var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	center_of_map = Vector2(573, 323)
	direction = (center_of_map - position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * speed * delta
