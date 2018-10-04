Class {
	#name : #GameUserStoryTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameUserStoryTest >> testAPlayerCannotPlayTwoTimesInARow [
	| game playerOne playerTwo diceOne diceTwo |
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	diceOne := Dice faces: 10.
	diceTwo := Dice faces: 12.
	game := Game playedBy: {playerOne.playerTwo} throwing:{diceOne.diceTwo} spaces: 50.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: 6.
	self should: [ game move: playerOne by: 3 ] 
	     raise: AssertionFailure 
	     withExceptionDo: [ :signal | self assert: signal messageText equals: 'You cannot play now!' ]
]

{ #category : #tests }
GameUserStoryTest >> testTwoPlayerPlayAndTheFirstOneWins [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo |
	sequenceOne := CircularCollection contains: #(6 3 10 1).
	sequenceTwo := CircularCollection contains: #(5 2 12 9).
	diceOne:= (Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne)).
	diceTwo:= (Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo)).
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	game := Game playedBy: { playerOne . playerTwo } throwing: { diceOne . diceTwo } spaces: 50.
	"The game starts"
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: { diceOne . diceTwo }).
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo by: (playerTwo roll: { diceOne . diceTwo }).
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: { diceOne . diceTwo }).
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo by: (playerTwo roll: { diceOne . diceTwo }).
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: { diceOne . diceTwo }).
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo by: (playerTwo roll: { diceOne . diceTwo }).
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: { diceOne . diceTwo }).
	self assert: game hasFinished .
	self assert: game playerPositions topPlayer equals: playerOne 
]
