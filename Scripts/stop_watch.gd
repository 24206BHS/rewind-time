extends Node2D

var offset = Vector2(230, -100)
@onready var players = get_tree().get_nodes_in_group("Playing")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().root.reset_player.connect(on_reset_player)

#func _process(delta: float) -> void:
	#pass

func on_reset_player():
	if players.size() > 0:
		reparent(players[0].get_node("Camera"), false)
	
