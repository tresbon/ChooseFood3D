extends Node2D

var _name

func take_polygon(name):
	$Sprite.texture = load("res://assets/Foods/" + name + '.png')
	_name = name
	
func sprite_size():
	return $Sprite.texture.get_width() * $Sprite.scale

func _ready():
	take_polygon(self._name)
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch \
	and event.is_pressed():
		print(_name)
		if _name in Global.food_to_choose:
			Global.emit_coorect_choose(_name)
			$ColorTween.interpolate_property(
				$Sprite, "modulate",
				Color(1, 1, 1, 1), Color(0.56, 0.82, 0.56, 1), .2,
				Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$ColorTween.start()
			var new_name = Global.choose_not_rendered_food()
			Global.remove_food_from_rendered(_name)
			Global.remove_food_to_choose(_name)
			Global.check_food_to_choose_empty()
			print(Global.rendered_foods, '\n', Global.food_to_choose)
			_name = new_name
			take_polygon(_name)
			Global.rendered_foods.append(_name)
		else:
			$ColorTween.interpolate_property(
				$Sprite, "modulate",
				Color(1, 1, 1, 1), Color(.88, .11, .45, 1), .2,
				Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$ColorTween.start()
			

func _on_ColorTween_tween_all_completed():
	$ColorTween.interpolate_property(
				$Sprite, "modulate", $Sprite.modulate,
				Color(1, 1, 1, 1), .2,
				Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$ColorTween.start()
