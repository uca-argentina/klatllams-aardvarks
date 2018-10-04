Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testAPlayerCannotPlayTwoTimesInARow [
	| game playersList dicesList playerOne playerTwo |
	playersList := CircularCollection new.
	dicesList := OrderedCollection new.
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	playersList
		add: playerOne;
		add: playerTwo.
	dicesList
		add: (Dice faces: 10);
		add: (Dice faces: 12).
	game := Game playedBy: playersList throwing: dicesList spaces: 50.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: 6.
	self should: [ game move: playerOne by: 3 ] raise: AssertionFailure
]

{ #category : #tests }
GameTest >> testCannotHaveLessThan2PlayersOrlessThan1Dice [
	"Test if a game is started correctly"

	| game playersList dicesList player |
	playersList := CircularCollection new.
	dicesList := OrderedCollection new.
	player := (Player named: 'Ignacio').
	playersList add: player.
	playersList add: (Player named: 'Hector').
	self should: [ game := Game playedBy: playersList throwing: dicesList spaces: 50 ] raise: AssertionFailure.
	dicesList add: (Dice faces: 5).
	self should: [ game := Game playedBy: playersList throwing: dicesList spaces:49] raise: AssertionFailure.
	playersList remove: player.
	self should: [ game := Game playedBy: playersList throwing: dicesList spaces: 50 ] raise: AssertionFailure
]

{ #category : #tests }
GameTest >> testGameIsNotFinishedIfNobodyHasPlayed [
	"Test for checking if a game just started it's not finished. hasFinished is an instance variable for checking if a movement is posible and if anyone has winned the game"
	|game playersList dicesList|
	playersList:= CircularCollection new.
	dicesList := OrderedCollection new.
	playersList add: (Player named: 'Hector') ; add: (Player named: 'Ignacio').
	dicesList add: (Dice faces:10) ; add: (Dice faces:12).
	game:= Game playedBy:playersList throwing:dicesList spaces:50. 
	self deny: game hasFinished.
]
