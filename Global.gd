extends Node

var food_to_choose : Array = []

signal chosen (_name)
signal correct_choose (true_or_false)

func _on_Global_chosen(_name):
	print(_name)
	print(123)
	return _name
	
func listen(_name):
	return _name in food_to_choose
