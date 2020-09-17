extends Node2D

class_name Food

var _name : String = 'wings'
signal chosen (_name)

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

func _ready():
	take_polygon(self._name)
	listen_choose()
	
func _process(delta):
	process_choose(true)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch \
	and event.is_pressed():
		print('tapped')
		emit_signal("chosen", self._name)

