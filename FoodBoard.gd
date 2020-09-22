extends Node2D

var food_to_choose : Array
var rendered_foods : Array

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
			Global.rendered_foods.append(f)
			var food = load("res://FoodBuilder.tscn").instance()
			food._name = f
			food.take_polygon(food._name)
			add_child(food)
			food.position += Vector2(food_row.find(f) * \
			200 + food.sprite_size().x,
			1000 + i * food.sprite_size().y)
	return foods.slice(0,16)
	
func _ready():
	rendered_foods = render(Global.foods)
	rendered_foods.shuffle()
	Global.food_to_choose = rendered_foods.slice(0,3)
	for ftc in Global.food_to_choose:
		$ProductList/ItemList.add_item(ftc)
	

