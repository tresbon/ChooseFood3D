extends Node

var food_to_choose : Array = []
var rendered_foods : Array = []

var foods : Array = [
	'popcorn',
	'coffee',
	'pancakes',
	'sausages',
	'bread',
	'wings',
	'steak',
	'burrito',
	'chops',
	'fries',
	'nuggets',
	'ramen',
	'cheese',
	'cola',
	'sausage',
	'roll',
	'salad',
	'nachos',
	'roastbeaf',
	'sauces',
	'sushi',
	'kebab',
	'pasta',
	'burger',
	'fish',
	'soup'
]
signal food_to_choose_empty
signal food_to_choose_updated
signal correct_choose

func get_foods_to_render():
	randomize()
	foods.shuffle()
	rendered_foods = foods.slice(0,15)
	
func get_foods_to_choose():
	randomize()
	rendered_foods.shuffle()
	food_to_choose = rendered_foods.slice(0,3)

func emit_coorect_choose(_name):
	if _name in food_to_choose:
		print(_name)
		emit_signal("correct_choose")

func remove_food_from_rendered(_name):
	rendered_foods.remove(
		rendered_foods.find(_name)
	)

func remove_food_to_choose(_name):
	#Удалить выбранное
	food_to_choose.remove(
		food_to_choose.find(_name)
	)
	emit_signal("food_to_choose_updated")

func check_food_to_choose_empty():
	if not food_to_choose:
		print('empty')
		randomize()
		rendered_foods.shuffle()
		food_to_choose = rendered_foods.slice(0,3)
		emit_signal("food_to_choose_empty")

func choose_not_rendered_food():
	randomize()
	foods.shuffle()
	for f in foods:
		if f in rendered_foods:
			continue
		else:
			return f
