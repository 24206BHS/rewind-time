extends Node2D

var player = preload("res://player.tscn")
signal reset_player

func _ready() -> void:
	self.reset_player.connect(on_reset_player)

#func _process(delta: float) -> void:
	#pass

func on_reset_player():
	var child = player.instantiate()
	child.position = CheckpointManager.active_checkpoint_position
	add_child(child)
	var cur = get_tree().get_nodes_in_group("Playing")[0]
	var prevPos = cur.get_node("Camera").global_position
	cur.get_node("Camera").reparent(child)
	var tween = create_tween()
	tween.tween_property(child.get_node("Camera"), "global_position", child.global_position, 0.5).from(prevPos)
	cur.remove_from_group("Playing")
	child.add_to_group("Playing")

func _on_area_2d_body_entered(body: Node2D) -> void:
	reset_player.emit()
	$Timer.start()

func _on_timer_timeout() -> void:
	reset_player.emit()
	$AudioStreamPlayer2.play()

func _on_portal_body_entered(body: Node2D) -> void:
	if body.is_in_group("Playing"):
		get_tree().change_scene_to_file("res://Win.tscn")
