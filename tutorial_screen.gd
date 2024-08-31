extends Control

var back_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_button = get_node("BackButton")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_pressed() -> void:
	Global.menu_sound.playing = true
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_button_mouse_entered() -> void:
	back_button.icon = load("res://art_assets/back_button_hovered.png")

func _on_back_button_mouse_exited() -> void:
	back_button.icon = load("res://art_assets/back_button.png")
	
func _on_back_button_button_down() -> void:
	back_button.icon = load("res://art_assets/back_button_pressed.png")
