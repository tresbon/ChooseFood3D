extends Node2D

class_name Food

var _name : String = 'wings'

func take_polygon(name):
	$Sprite.texture = load("res://assets/Foods/" + _name + '.png')
	return
	
func process_choose(chosen_right):
	if chosen_right:
		return
	else:
		return

func listen_choose():
	#Оформляет подписку: выбранный объект
	#есть в задании?
	return
	
func sprite_size():
	return $Sprite.texture.get_width() * $Sprite.scale

func _ready():
	take_polygon(self._name)
	listen_choose()
	
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch \
	and event.is_pressed():
		Global.emit_signal("chosen", _name)

