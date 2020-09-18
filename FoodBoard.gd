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
	for i in range(4):
		food_row = foods.slice(i*4,i*4+3,1)
		for f in food_row:
			print(food_row)
			var food = load("res://FoodBuilder.tscn").instance()
			food._name = f
			food.take_polygon(food._name)
			add_child(food)
			food.position += Vector2(food_row.find(f) * \
			food.sprite_size().x,
			i * food.sprite_size().y)
	return
	
func _ready():
	foods.shuffle()
	render(foods)

