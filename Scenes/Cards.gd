extends Control

func _on_JackCard_pressed():
	$KingCard.disabled = false

func _on_KingCard_pressed():
	$TenCard.disabled = false

func _on_10Card_pressed():
	$QueenCard.disabled = false

func _on_QueenCard_pressed():
	$AceCard.disabled = false

func _on_AceCard_pressed():
	$EightCard.disabled = false

func _on_8Card_pressed():
	$Mine.show()
