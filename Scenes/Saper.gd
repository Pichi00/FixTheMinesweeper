extends Node2D

var logo_drag = false

func _ready():
	$Credits/JamLogo.input_pickable = true

func _input(event):
	$UI/MinesLabel.text = "Mines: " + str(Global.mines) + "/10"
#	if event is InputEventMouseButton:
#		if event.button_index == BUTTON_LEFT and logo_drag:
#			$Credits/JamLogo.position = get_local_mouse_position()

func _physics_process(_delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and logo_drag:
		$Credits/JamLogo.position = get_local_mouse_position()

func _on_Minesweeper_pressed():
	$MineSweeperWindow.show()

func _on_Message_pressed():
	$Messages.show()


func _on_ImportantMessage_pressed():
	$Messages/CodedMessage.show()


func _on_TextureButton_pressed():
	if $Internet/TextEdit.text == "www.mines.com":
		$Internet/ErrorMessage.hide()
		$Internet/Mine.show()
	else:
		$Internet/ErrorMessage.show()

func _on_Explorer_pressed():
	$Internet.show()

func _on_codetxt_pressed():
	$Documents/Code.show()

func _on_Documents_pressed():
	$Documents.show()

func _on_JamLogo_mouse_entered():
	logo_drag = true

func _on_JamLogo_mouse_exited():
	logo_drag = false

func _on_Credits_pressed():
	$Credits.show()
