extends TextureButton

func _on_Button_pressed():
	queue_free()
	for item in get_tree().get_nodes_in_group("MinesweeperButton"):
		item.disabled = true
	for item in get_tree().get_nodes_in_group("MineButton"):
		item.disabled = false
	get_tree().get_nodes_in_group("UI")[0].show()
