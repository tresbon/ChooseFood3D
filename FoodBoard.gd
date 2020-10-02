extends Node2D

var rendered_foods : Array
var rendered_foods_scenes : Array

func render():
	Global.get_foods_to_render()
	rendered_foods = Global.rendered_foods
	var food_row
	for i in range(4):
		food_row = rendered_foods.slice(i*4,i*4+3,1)
		for f in food_row:
			var food = load("res://assets/FoodBuilder.tscn").instance()
			food._name = f
			food.take_polygon(food._name)
			food.position += Vector2(food_row.find(f) * \
			200 + food.sprite_size().x,
			1000 + i * food.sprite_size().y)
			rendered_foods_scenes.append(food)
			$CanvasLayer.add_child(food)
	
func get_foods():
	Global.get_foods_to_choose()
	for ftc in Global.food_to_choose:
		$ProductList/ItemList.add_item(ftc)
	

