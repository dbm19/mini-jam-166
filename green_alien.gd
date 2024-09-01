extends Area2D

var center_of_map
var speed = 100
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

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("normal_bullet") && is_in_group("normal_alien"):
		green_alien_sprite.texture = load("res://art_assets/blue_alien.png")
		remove_from_group("normal_alien")
		area.queue_free()
		remove_from_group("green_alien")
		add_to_group("blue_alien")
		Global.score += 1
		Global.shots_landed += 1
		print(Global.shots_landed)
	elif area.is_in_group("peg_bullet") && is_in_group("peg_alien"):
		green_alien_sprite.texture = load("res://art_assets/blue_alien.png")
		remove_from_group("peg_alien")
		area.queue_free()
		remove_from_group("green_alien")
		add_to_group("blue_alien")
		Global.score += 1
		Global.shots_landed += 1
		print(Global.shots_landed)
	elif area.is_in_group("bubble_bullet") && is_in_group("bubble_alien"):
		green_alien_sprite.texture = load("res://art_assets/blue_alien.png")
		remove_from_group("bubble_alien")
		area.queue_free()
		remove_from_group("green_alien")
		add_to_group("blue_alien")
		Global.score += 1
		Global.shots_landed += 1
		print(Global.shots_landed)

	if Global.score == 100:
		Global.player_won = true
		get_tree().change_scene_to_file("res://score_screen.tscn")
