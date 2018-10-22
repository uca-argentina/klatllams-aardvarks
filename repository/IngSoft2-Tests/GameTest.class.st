Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testAGameCanHaveABoardWithRandomDistributesSpaces [
| game playerOne playerTwo diceOne diceTwo |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	game := Game playedBy: {playerOne.playerTwo} throwing:{diceOne.diceTwo} spaces: 100 totalLaps:2.
]

{ #category : #tests }
GameTest >> testAPlayerCannotPlayTwoTimesInARow [
	| game playerOne playerTwo diceOne diceTwo spacesCollection |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	spacesCollection := BoardTest createNoEffectSpacesCollection.
	game := Game playedBy: {playerOne.playerTwo} throwing:{diceOne.diceTwo} boardComposedBy: spacesCollection totalLaps:2.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self should: [ game move: playerOne ] 
	     raise: AssertionFailure 
	     withExceptionDo: [ :signal | self assert: signal messageText equals: 'You cannot play now!' ]
]

{ #category : #tests }
GameTest >> testCannotHaveLessThan2PlayersOrlessThan1Dice [
	| game playerOne playerTwo diceOne diceTwo spacesCollection |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	spacesCollection := BoardTest createNoEffectSpacesCollection.
	self should: [ 
			game := Game playedBy: {playerOne} throwing:{diceOne.diceTwo} boardComposedBy: spacesCollection totalLaps:2. ]
		  raise: AssertionFailure
		  withExceptionDo: [ :signal | self assert: signal messageText equals: 'Players quantity must be 2 or more' ];
	      should: [ 
			 game := Game playedBy: {playerOne.playerTwo} throwing:{} boardComposedBy: spacesCollection totalLaps:2. ] 
		   raise: AssertionFailure
		   withExceptionDo: [ :signal | self assert: signal messageText equals: 'Dices quantity must be 1 or more' ]
]

{ #category : #tests }
GameTest >> testGameIsNotFinishedIfNobodyHasPlayed [
	| game playerOne playerTwo diceOne diceTwo spacesCollection |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	spacesCollection := BoardTest createNoEffectSpacesCollection.
	game := Game playedBy: {playerOne.playerTwo} throwing:{diceOne.diceTwo} boardComposedBy: spacesCollection totalLaps:2.
	self deny: game hasFinished.
]
