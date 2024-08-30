extends PathFollow2D

var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed
	
	if Input.is_action_just_pressed("change_direction"):
		speed = speed * -1
