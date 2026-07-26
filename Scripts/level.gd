extends Node2D

var player = preload("res://player.tscn")
signal reset_player

func _ready() -> void:
	self.reset_player.connect(on_reset_player)

#func _process(delta: float) -> void:
	#pass

func on_reset_player():
	var child = player.instantiate()
	child.position = Vector2(100,450)
	add_child(child)
	var cur = get_tree().get_nodes_in_group("Playing")[0]
	cur.get_node("Camera").reparent(child)
	var tween = create_tween()
	tween.tween_property(child.get_node("Camera"), "position", Vector2.ZERO, 1)
	cur.remove_from_group("Playing")
	child.add_to_group("Playing")

func _on_area_2d_body_entered(body: Node2D) -> void:
	reset_player.emit()
	$Timer.start()

func _on_timer_timeout() -> void:
	reset_player.emit()
