#checkpoint.gd
extends  Area2D

signal reset_stopwatch

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Playing"):
		CheckpointManager.active_checkpoint_position = global_position
		CheckpointManager.has_checkpoint = true
	get_parent().get_node("Timer").start()
	reset_stopwatch.emit()
