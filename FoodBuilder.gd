extends Node2D

var _name : String = 'wings'

func take_polygon(name):
	$Sprite.texture = load("res://assets/Foods/" + _name + '.png')
	return
	
func print_hello():
	print('hello from food')
	
func sprite_size():
	return $Sprite.texture.get_width() * $Sprite.scale

func _ready():
	take_polygon(self._name)
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch \
	and event.is_pressed():
		if Global.listen(_name):
			hide()
		print(_name)

