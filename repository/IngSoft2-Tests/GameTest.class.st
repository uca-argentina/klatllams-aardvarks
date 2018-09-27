Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testAPlayerCannotPlayTwoTimesInARow [
	|game playersList dicesList playerOne playerTwo |
	playersList:= LinkedList new.
	dicesList := LinkedList new.
	playerOne:=Player name: 'Hector'.
	playerTwo:= Player name: 'Ignacio'.
	playersList add: playerOne ; add: playerTwo.
	dicesList add: (Dice facesQuantity:10) ; add: (Dice facesQuantity:12).
	game:= Game players:playersList dices:dicesList. 
	self assert: game hasTheTurn equals: playerOne.
	game updateNextPlayer.
	self assert: game hasTheTurn equals: playerTwo.
	game updateNextPlayer.
	self assert: game hasTheTurn equals: playerOne.
]

{ #category : #tests }
GameTest >> testCannotHaveLessThan2PlayersOrlessThan1Dice [
	"Test if a game is started correctly"
	|game playersList dicesList|
	playersList:= LinkedList new.
	dicesList := LinkedList new.
	playersList add: (Player name: 'Hector').
	self should: [game:= Game players:playersList dices:dicesList] raise: AssertionFailure .
	playersList add:(Player name: 'Ignacio').
	self should: [ game:= Game players:playersList dices:dicesList] raise: AssertionFailure .

]

{ #category : #tests }
GameTest >> testGameExistsAndHasTwoDicesAndTwoPlayersAndBoard [
	"The test for game creation"
	|game playersList dicesList|
	playersList:= LinkedList new.
	dicesList := LinkedList new.
	playersList add: (Player name: 'Hector') ; add: (Player name: 'Ignacio').
	dicesList add: (Dice facesQuantity:10) ; add: (Dice facesQuantity:12).
	game:= Game players:playersList dices:dicesList. 
	
]

{ #category : #tests }
GameTest >> testGameIsNotFinishedIfNobodyHasPlayed [
	"Test for checking if a game just started it's not finished. hasFinished is an instance variable for checking if a movement is posible and if anyone has winned the game"
	|game playersList dicesList|
	playersList:= LinkedList new.
	dicesList := LinkedList new.
	playersList add: (Player name: 'Hector') ; add: (Player name: 'Ignacio').
	dicesList add: (Dice facesQuantity:10) ; add: (Dice facesQuantity:12).
	game:= Game players:playersList dices:dicesList. 
	self deny: game hasFinished.
]

{ #category : #tests }
GameTest >> testWhenGameStartsTheFirstPlayerHasTheTurn [
	"Test for instance variable playerNumber which gives you the player number of the players collection who can play. hasTheTurn gives you the player object inside the players collection"
	|game playersList dicesList playerHector|
	playersList:= LinkedList new.
	dicesList := LinkedList new.
	playerHector:= Player name: 'Hector'.
	playersList add: playerHector  ; add: (Player name: 'Ignacio').
	dicesList add: (Dice facesQuantity:10) ; add: (Dice facesQuantity:12).
	game:= Game players:playersList dices:dicesList.
	self assert: game hasTheTurn equals: playerHector. 
]
