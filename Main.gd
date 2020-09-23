extends Node2D

var screensize
var level = 1

func _ready():
	$HUD/MarginContainer/ScoreLabel.text = str(Global.score)
	$HUD/MarginContainer/TimeLabel.text = '30'
	
func game_over():
	pass
	
func next_level():
	$HUD/MarginContainer/TimeLabel.text =\
	 str(int($HUD/MarginContainer/TimeLabel.text) + 20)

func _on_Timer_timeout():
	$HUD/MarginContainer/TimeLabel.text = \
	str(int($HUD/MarginContainer/TimeLabel.text) - 1)
	if not int($HUD/MarginContainer/TimeLabel.text):
		game_over()
