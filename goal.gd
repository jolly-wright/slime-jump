
extends Area2D

var game_finished := false

@onready var victory_screen: Control = \
	$"../VictoryUI/VictoryScreen"

@onready var replay_button: Button = \
	$"../VictoryUI/VictoryScreen/CenterContainer/Panel/Content/ReplayButton"


func _ready() -> void:
	victory_screen.hide()
	victory_screen.process_mode = Node.PROCESS_MODE_ALWAYS

	body_entered.connect(_on_body_entered)
	replay_button.pressed.connect(_on_replay_pressed)


func _on_body_entered(body: Node2D) -> void:
	if game_finished:
		return

	if body.name == "Player":
		game_finished = true
		victory_screen.show()
		get_tree().paused = true


func _on_replay_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
