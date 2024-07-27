class_name GameOverUI
extends CanvasLayer

@onready var time_label: Label = %TimeLabel
@onready var mosnters_label: Label = %MonstersLabel

@export var restart_delay: float = 5.0
var restart_cooldown: float

func _ready():
	time_label.text = GameManger.time_elapsed_string
	mosnters_label.text = str(GameManger.monsters_defeated_counter)
	restart_cooldown = restart_delay

func _process(delta):
	restart_cooldown -= delta
	if restart_cooldown <= 0.0:
		restart_game()
		
func restart_game():
	GameManger.reset()
	get_tree().reload_current_scene()
	
