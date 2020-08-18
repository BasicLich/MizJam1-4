extends Node

enum ScreenStates {
	NONE = -1,
	TITLE,
	TITLE_TO_RACE,
	RACE,
	RACE_END
}

var screenState: int = ScreenStates.NONE

var game: Game = null

func _ready():
	screenState = ScreenStates.TITLE

func _input(event: InputEvent) -> void:
	match screenState:
		ScreenStates.TITLE:
			if event.is_action_pressed("ui_accept"):
				game.startTransitionFromTitleToRace()
				screenState = ScreenStates.RACE
		ScreenStates.RACE:
			if Input.is_key_pressed(KEY_F1):
				screenState = ScreenStates.TITLE
				game.restartGame()
		ScreenStates.RACE_END:
			if event.is_action_pressed("ui_accept"):
				game.startTransitionFromRaceEndToRace()
				screenState = ScreenStates.RACE
