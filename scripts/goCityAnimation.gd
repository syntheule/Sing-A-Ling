extends Node2D
var timer
var time = false
var timeText = 5
var countdownText = ""  # Text to display the countdown
var addEnergy = false
var energyAdded = false
onready var label = $Label

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 5
	timer.connect("timeout", self, "_on_Timer_timeout")

func _physics_process(delta):
	if timeText > 0:
		countdownText = "Remaining time: " + str(int(timeText))
		label.text = countdownText
		timeText -= 1 * delta
	
	print (int(timeText) == 0, timeText)
	if int(timeText) == 0:
		_on_Timer_timeout()
		get_tree().change_scene("res://city.tscn")
		
	if addEnergy:
		timer.start()
		addEnergy = false
		energyAdded = false
		
func _on_Timer_timeout():
	get_tree().change_scene("res://city.tscn")
		
