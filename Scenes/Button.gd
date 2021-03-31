extends TextureButton

func _on_Button_pressed():
	queue_free()
	for item in get_tree().get_nodes_in_group("MinesweeperButton"):
		item.disabled = true

	get_tree().get_nodes_in_group("AnimPlay")[0].play("StartSearching")
