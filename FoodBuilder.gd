extends Spatial

var _name
signal chosen (_name)

func take_polygon(name):
	#По имени полигона выбирает полигон из библиотеки
	return
	
func process_choose(chosen_right):
	if chosen_right:
		return
	else:
		return

func listen_choose():
	#Оформляет подписку: выбранный объект
	#есть в задании?
	return

func _ready():
	take_polygon(_name)
	listen_choose()
	
func _process(delta):
	process_choose(true)
