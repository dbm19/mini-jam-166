extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_down() -> void:
	icon = load("res://new_game_button_pressed.png")

func _on_button_up() -> void:
	icon = load("res://new_game_button.png")

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
