Class {
	#name : #GameUserStoryTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameUserStoryTest >> testTwoPlayerPlayAndTheFirstOneWins [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo |
	sequenceOne := CircularCollection contains: #(6 3 10 1).
	sequenceTwo := CircularCollection contains: #(5 2 12 9).
	diceOne:= (Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10)).
	diceTwo:= (Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12)).
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	game := Game playedBy: { playerOne . playerTwo } throwing: { diceOne . diceTwo } spaces: 50.
	"The game starts"
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: game dices).
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo by: (playerTwo roll: game dices).
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: game dices).
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo by: (playerTwo roll: game dices).
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: game dices).
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo by: (playerTwo roll: game dices).
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne by: (playerOne roll: game dices).
	self assert: game hasFinished .
	self assert: game playerPositions topPlayer equals: playerOne 
]
