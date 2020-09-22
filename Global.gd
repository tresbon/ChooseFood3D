extends Node

var food_to_choose : Array = []
var rendered_foods : Array = []
var screen_size
var score
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

func new_food(_name):
	var new_foods : Array = []
	food_to_choose.remove(
		food_to_choose.find(_name)
	)
	for f in foods:
		if f in rendered_foods:
			continue
		else:
			rendered_foods.append(f)
			return f
