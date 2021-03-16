extends Node2D

func _ready():
	pass # Replace with function body.

func _on_Button_pressed():
	for item in get_tree().get_nodes_in_group("MinesweeperButton"):
		item.disabled = true
	$Message.hide()
	$Message2.show()


func _on_Minesweeper_pressed():
	$MineSweeperWindow.show()

func _on_TextureButton_pressed():
	$MineSweeperWindow.hide()


func _on_Kernel_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_Message2_pressed():
	$Kernel.show()
