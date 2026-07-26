#checkpoint.gd
extends  Area2D
var CheckpointManager

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Playing"):
		CheckpointManager.active_checkpoint_position = global_position
		CheckpointManager.has_checkpoint = true
