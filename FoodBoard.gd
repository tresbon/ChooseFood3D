extends Node2D

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

func render(foods : Array):
	#Рендерит еду из foods
	#Перемешать еду
	var food_row
	foods.shuffle()
	for i in range(4):
		food_row = foods.slice(i*4,(i+1)*4)
		for f in food_row:
			var food = load("res://FoodBuilder.tscn").instance()
			food._name = foods[i]
			food.position.x += i * food.sprite_size
			add_child(food)
	return
	
func _ready():
	render(foods)

