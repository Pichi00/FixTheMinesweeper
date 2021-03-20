extends Node2D

var logo_drag = false
var square_drag = false
var hour = 12
var minute = 0
var sec = 0
var hh
var mm
var ss

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
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and square_drag:
		$Terminal/BlackSquare.position = get_local_mouse_position()

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

func _on_TwitterButton_pressed():
	OS.shell_open("https://twitter.com/pichiDev")

func _on_ItchButton_pressed():
	OS.shell_open("https://pichidev.itch.io/")


func _on_EnterButton_pressed():
	if $Terminal/CommandInput.text == "light":
		$Terminal/ColorRect.color = Color(255,255,255)
	else:
		$Terminal/CommandLabel.text = "\n Unknown command"

func _on_TerminalButton_pressed():
	$Terminal.show()

func _on_BlackSquare_mouse_entered():
	square_drag = true

func _on_BlackSquare_mouse_exited():
	square_drag = false


func _on_Timer_timeout():
	sec += 1
	if sec == 60:
		sec = 0
		minute += 1
		if minute == 60:
			hour += 1
			if hour == 24:
				hour = 0
	if hour<10:
		hh = "0"+str(hour)
	else:
		hh = str(hour)
	if minute<10:
		mm = "0"+str(minute)
	else:
		mm = str(minute)
	if sec<10:
		ss = "0"+str(sec)
	else:
		ss = str(sec)
	$SystemBar/Time.text = hh+" : "+mm+" : "+ss

func _on_commandstxt_pressed():
	$Documents/Commands.show()

func _on_Trash_pressed():
	$Bin.show()

func _on_pokerjpg_pressed():
	$Pictures/Poker.show()

func _on_Pictures_pressed():
	$Pictures.show()

func _on_MyComp_pressed():
	$MyComp.show()

func _on_GamesButton_pressed():
	$MyComp/Games.show()

func _on_SolitareButton_pressed():
	$Solitare.show()

func _on_GooseButton_pressed():
	$Goose.show()
