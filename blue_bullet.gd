extends Area2D

var direction
var center_of_map = Vector2(573, 323)
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direction = (global_position - center_of_map).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * speed * delta
