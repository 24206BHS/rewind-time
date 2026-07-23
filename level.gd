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
	
