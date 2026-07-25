extends Node2D

var offset = Vector2(230, -90)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Stop Watch")

func _process(delta: float) -> void:
	var players = get_tree().get_nodes_in_group("Playing")
	if players.size() > 0:
		position = players[0].position + offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
