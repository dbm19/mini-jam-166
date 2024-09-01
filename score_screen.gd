extends Control


var rng = RandomNumberGenerator.new()
var quotes = [
	"Blue Eggs and Ham",
	"Bluesleeves",
	"Anne of Blue Gables",
	"Blue Tea",
	"The Blue Mile",
	"Bluewich",
	"Bluehouse Effect",
	"Blue Bay Packers",
]
var score 
var blue_quote
var back_button
var shot_accuracy
var shots_fired_label
var shots_landed_label
var accuracy_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blue_quote = get_node("ScoreScreenBackground/VBoxContainer/ScoreCard/BlueQuote")
	score = get_node("ScoreScreenBackground/VBoxContainer/ScoreCard/Score")
	shots_fired_label = get_node("TextureRect/VBoxContainer2/ShotsLandedLabel")
	shots_landed_label = get_node("TextureRect/VBoxContainer2/ShotsFiredLabel")
	accuracy_label = get_node("TextureRect/VBoxContainer2/AccuracyLabel")
	
	
	if Global.player_won == true:
		Global.im_blue_sound.playing = true
		Global.clapping_sound.playing = true
		Global.background_music.playing = false
	else:
		Global.explosion_sound.playing = true
		if Global.score == 0:
			Global.uhh_sound.playing = true
			Global.background_music.playing = false

		else:
			Global.clapping_sound.playing = true

	score.text = str(Global.score)
	blue_quote.text = quotes[rng.randi_range(0, 7)]
	
	if Global.shots_fired != 0:
		accuracy_label.text = "Shot accuracy: " + str(snapped(((float(Global.shots_landed) / float(Global.shots_fired)) * 100), 0.01)) + "%"
	else:
		accuracy_label.text = "Shot accuracy: 0%"
		
	shots_fired_label.text = "Shots fired: " + str(Global.shots_fired)
	shots_landed_label.text = "Shots landed: " + str(Global.shots_landed)
	back_button = get_node("BackButton")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_pressed() -> void:
	Global.menu_sound.playing = true
	if Global.background_music.playing == false:
		Global.background_music.playing = true
	back_button.icon = load("res://art_assets/back_button_pressed.png")
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_back_button_mouse_entered() -> void:
	back_button.icon = load("res://art_assets/back_button_hovered.png")

func _on_back_button_mouse_exited() -> void:
	back_button.icon = load("res://art_assets/back_button.png")
	
func _on_back_button_button_down() -> void:
	back_button.icon = load("res://art_assets/back_button_pressed.png")
