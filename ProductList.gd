extends Control

var level
var products
signal correct_choose (true_or_false)

func products_list(level):
	#Генерирует список продуктов
	return
	
func correct_choose(product, list):
	if product in list:
		return true
	else:
		return false
		
func get_product():
	#Возвращает какой продукт был тапнут
	return
		
func new_level(level):
	products = products_list(level)
	
func _process(delta):
	correct_choose(get_product(), products)



