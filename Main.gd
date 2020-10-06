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
	$FoodBoard.render()
	$FoodBoard.get_foods()

func food_to_choose_empty():
	next_level()
	level += 1
	$FoodBoard/ProductList/ItemList.clear()
	for f in Global.food_to_choose:
		$FoodBoard/ProductList/ItemList.add_item(f)
	
func restart():
	Global.get_foods_to_render()
	$FoodBoard.rendered_foods = Global.rendered_foods
	for f in $FoodBoard.rendered_foods_scenes:
		f.take_polygon($FoodBoard.rendered_foods[
			$FoodBoard.rendered_foods_scenes.find(f)
		])
	Global.get_foods_to_choose()
	$FoodBoard/ProductList/ItemList.clear()
	for f in Global.food_to_choose:
		$FoodBoard/ProductList/ItemList.add_item(f)
	$HUD/MarginContainer/TimeLabel.text = '30'
	$HUD/GameOver.hide()
	
func game_over():
	$HUD/GameOver/GOScoreLabel.text =\
		'Score: ' + str(score)
	$HUD/GameOver.show()

	
func next_level():
	$HUD/MarginContainer/TimeLabel.text =\
	 str(int($HUD/MarginContainer/TimeLabel.text) + 10)

func new_level():
	score = 0
	$HUD/MarginContainer/ScoreLabel.text = str(score)

func _on_Timer_timeout():
	$HUD/MarginContainer/TimeLabel.text = \
	str(int($HUD/MarginContainer/TimeLabel.text) - 1)
	if not int($HUD/MarginContainer/TimeLabel.text):
		game_over()

func _on_Global_correct_choose():
	$FoodBoard/ProductList/ItemList.clear()
	for f in Global.food_to_choose:
		$FoodBoard/ProductList/ItemList.add_item(f)
	score += 1
	$HUD/MarginContainer/ScoreLabel.text = str(score)
