extends Node2D

var player = preload("res://player.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var child = player.instantiate()
	child.position = Vector2(100,450)
	add_child(child)
	var cur = get_tree().get_nodes_in_group("Playing")[0]
	cur.get_node("Camera").reparent(child)
	var tween = create_tween()
	tween.tween_property(child.get_node("Camera"), "position", Vector2.ZERO, 1)
	cur.remove_from_group("Playing")
	child.add_to_group("Playing")
	
