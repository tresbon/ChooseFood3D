extends Spatial

var foods : Array

func render(foods : Array):
	#Рендерит еду из foods
	#Перемешать еду
	foods.shuffle()
	return
	
func _ready():
	render(foods)

