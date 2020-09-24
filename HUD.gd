extends Control

signal restart

func _ready():
	$GameOver.hide()

func _on_GOButton_pressed():
	emit_signal("restart")
