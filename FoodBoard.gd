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

func correct_choose(product, list):
	if product in list:
		Global.emit_signal('correct_choose', true) 
	else:
		Global.emit_signal('correct_choose', false)

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
	var rendered_foods = render(foods)
	self.connect('_on_Global_chosen',
		Global,correct_choose(1,rendered_foods))
	rendered_foods.shuffle()
	food_to_choose = rendered_foods.slice(0,3)
	for ftc in food_to_choose:
		$ProductList/ItemList.add_item(ftc)
	

