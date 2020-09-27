extends Node2D

var rendered_foods : Array
var my_foods : Array

func render(foods : Array):
	#Рендерит еду из foods
	#Перемешать еду
	randomize()
	foods.shuffle()
	var food_row
	for i in range(4):
		food_row = foods.slice(i*4,i*4+3,1)
		for f in food_row:
			Global.rendered_foods.append(f)
			var food = load("res://FoodBuilder.tscn").instance()
			food._name = f
			food.take_polygon(food._name)
			my_foods.append(food)
			add_child(food)
			food.position += Vector2(food_row.find(f) * \
			200 + food.sprite_size().x,
			1000 + i * food.sprite_size().y)
	return foods.slice(0,16)
	
func _ready():
	rendered_foods = render(Global.foods)
	randomize()
	rendered_foods.shuffle()
	Global.food_to_choose = rendered_foods.slice(0,3)
	for ftc in Global.food_to_choose:
		$ProductList/ItemList.add_item(ftc)
	

