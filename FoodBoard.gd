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

var food_to_choose : Array
var rendered_foods : Array

func correct_choose(product):
	print('chosen')
	if product in rendered_foods:
		Global.emit_signal('correct_choose', true) 
	else:
		Global.emit_signal('correct_choose', false)

func print_hello():
	print('hello')

func render(foods : Array):
	#Рендерит еду из foods
	#Перемешать еду
	foods.shuffle()
	var food_row
	for i in range(4):
		food_row = foods.slice(i*4,i*4+3,1)
		for f in food_row:
			var food = load("res://FoodBuilder.tscn").instance()
			food._name = f
			food.take_polygon(food._name)
			add_child(food)
			food.position += Vector2(food_row.find(f) * \
			food.sprite_size().x,
			i * food.sprite_size().y)
	return foods.slice(0,16)
	
func _ready():
	rendered_foods = render(foods)
	rendered_foods.shuffle()
	Global.food_to_choose = rendered_foods.slice(0,3)
	for ftc in Global.food_to_choose:
		$ProductList/ItemList.add_item(ftc)
	

