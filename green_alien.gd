extends RigidBody2D

var center_of_map
var speed = 80.0
var direction
var green_alien_sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	green_alien_sprite = get_node("GreenAlienSprite")
	center_of_map = Vector2(573, 323)
	direction = (center_of_map - position).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * speed * delta

func _on_green_alien_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		green_alien_sprite.texture = load("res://blue_alien.png")
