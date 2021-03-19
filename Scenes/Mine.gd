extends TextureButton

func _on_Mine_pressed():
	Global.mines += 1
	queue_free()
