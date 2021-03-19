extends Node2D

func _ready():
	pass # Replace with function body.

func _input(event):
	$UI/MinesLabel.text = "Mines: " + str(Global.mines) + "/10"

func _on_Minesweeper_pressed():
	$MineSweeperWindow.show()


func _on_Kernel_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_Message2_pressed():
	$Kernel.show()
