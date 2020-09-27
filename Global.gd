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
signal correct_choose

func emit_coorect_choose(_name):
	if _name in food_to_choose:
		print(_name)
		emit_signal("correct_choose")

func delete_chosen_food(_name):
	rendered_foods.remove(
		rendered_foods.find(_name)
	)

func new_food(_name):
	#Удалить выбранное
	food_to_choose.remove(
		food_to_choose.find(_name)
	)
	var not_rendered_food
	if not food_to_choose:
		print('empty')
		food_to_choose = rendered_foods.slice(0,3)
		emit_signal("food_to_choose_empty")
	not_rendered_food = choose_not_rendered_food()
	rendered_foods.remove(
		rendered_foods.find(_name)
	)
	return not_rendered_food

func choose_not_rendered_food():
	for f in foods:
		if f in rendered_foods:
			continue
		else:
			return f
