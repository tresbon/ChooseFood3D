extends Node2D

var _name : String 

func take_polygon(name):
	$Sprite.texture = load("res://assets/Foods/" + name + '.png')
	
func sprite_size():
	return $Sprite.texture.get_width() * $Sprite.scale

func _ready():
	take_polygon(self._name)
	print($Sprite.modulate)
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch \
	and event.is_pressed():
		if _name in Global.food_to_choose:
			$ColorTween.interpolate_property(
				$Sprite, "modulate",
				Color(1, 1, 1, 1), Color(0.56, 0.82, 0.56, 1), .2,
				Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$ColorTween.start()
			take_polygon(Global.new_food(_name))
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
