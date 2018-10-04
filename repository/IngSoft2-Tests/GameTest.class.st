Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testCannotHaveLessThan2PlayersOrlessThan1Dice [
	| game playerOne playerTwo diceOne diceTwo |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	self should: [ 
			game := Game playedBy: {playerOne} throwing:{diceOne.diceTwo} spaces: 49 ]
		  raise: AssertionFailure
		  withExceptionDo: [ :signal | self assert: signal messageText equals: 'Players quantity must be 2 or more' ];
	      should: [ 
			 game := Game playedBy: {playerOne.playerTwo} throwing: #() spaces: 50 ] 
		   raise: AssertionFailure
		   withExceptionDo: [ :signal | self assert: signal messageText equals: 'Dices quantity must be 1 or more' ];
	      should: [ 
			 game := Game playedBy: {playerOne.playerTwo} throwing:{diceOne.diceTwo} spaces: 49 ]
		   raise: AssertionFailure
		   withExceptionDo: [ :signal | self assert: signal messageText equals: 'Must have more than 49 spaces' ]
]

{ #category : #tests }
GameTest >> testGameIsNotFinishedIfNobodyHasPlayed [
	| game playerOne playerTwo diceOne diceTwo |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	game := Game playedBy: {playerOne.playerTwo} throwing:{diceOne.diceTwo} spaces: 50.
	self deny: game hasFinished.
]
