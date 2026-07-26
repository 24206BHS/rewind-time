extends Node2D

var offset = Vector2(230, -100)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Stop Watch")
	get_tree().current_scene.reset_player.connect(on_reset_player)
	
	# Wait 1 frame so the Player node can finish loading into the group
	await get_tree().process_frame
	on_reset_player()

#func _process(delta: float) -> void:
	#pass

func on_reset_player():
	var players = get_tree().get_nodes_in_group("Playing")
	if players.size() > 0:
		reparent(players[0].get_node("Camera"), false)
		position = offset
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.play("Stop Watch")
