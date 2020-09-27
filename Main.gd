extends Node2D

var screensize : Vector2
var level : int = 1
var score : int = 0

func _ready():
	$HUD/MarginContainer/ScoreLabel.text = str(score)
	$HUD/MarginContainer/TimeLabel.text = '30'
	Global.connect('correct_choose', self, '_on_Global_correct_choose')
	Global.connect('food_to_choose_empty', self, 'food_to_choose_empty')
	$HUD.connect('restart', self, 'restart')

func food_to_choose_empty():
	next_level()
	level += 1
	$FoodBoard/ProductList/ItemList.clear()
	for f in Global.food_to_choose:
		$FoodBoard/ProductList/ItemList.add_item(f)
	
func restart():
	Global.rendered_foods = Global.foods.slice(0,15)
	for f in $FoodBoard.my_foods:
		f.take_polygon(Global.rendered_foods[
			$FoodBoard.my_foods.find(f)
		])
	randomize()
	Global.rendered_foods.shuffle()
	Global.food_to_choose = Global.rendered_foods.slice(0,3)
	$FoodBoard/ProductList/ItemList.clear()
	for f in Global.food_to_choose:
		$FoodBoard/ProductList/ItemList.add_item(f)
	$HUD/MarginContainer/TimeLabel.text = '30'
	$HUD/GameOver.hide()
	
func game_over():
	$HUD/GameOver/Panel/GOScoreLable.text =\
		'Score: ' + str(score)
	$HUD/GameOver.show()

	
func next_level():
	$HUD/MarginContainer/TimeLabel.text =\
	 str(int($HUD/MarginContainer/TimeLabel.text) + 20)

func new_level():
	score = 0
	$HUD/MarginContainer/ScoreLabel.text = str(score)

func _on_Timer_timeout():
	$HUD/MarginContainer/TimeLabel.text = \
	str(int($HUD/MarginContainer/TimeLabel.text) - 1)
	if not int($HUD/MarginContainer/TimeLabel.text):
		game_over()

func _on_Global_correct_choose():
	score += 1
	$HUD/MarginContainer/ScoreLabel.text = str(score)

		
		
