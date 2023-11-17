extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over(new_high_score: bool):
	show_message("New High Score!!" if new_high_score else "Game Over")
	await $MessageTimer.timeout

	$Message.text = "Dodge the Creeps!"
	$Message.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score: int):
	$ScoreLabel.text = str(score)
	
func update_high_score(high_score: int):
	$HighScoreLabel.show()
	$HighScoreLabel.text = "High: " + str(high_score)


func _on_message_timer_timeout() -> void:
	$Message.hide()


func _on_start_button_pressed() -> void:
	$StartButton.hide()
	$HighScoreLabel.hide()
	start_game.emit()
