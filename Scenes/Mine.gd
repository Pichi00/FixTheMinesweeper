extends Node2D

func _on_Mine_pressed():
	Global.mines += 1
	$Mine.queue_free()
	if Global.mines == 10:
		get_tree().get_nodes_in_group("Desktop")[0].game_over()
	else:
		$Collect.play()
