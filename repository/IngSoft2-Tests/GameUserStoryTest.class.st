Class {
	#name : #GameUserStoryTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameUserStoryTest >> testTwoPlayerPlayAndTheFirstOneWins [
	| game playersCollection dicesCollection playerOne playerTwo sequenceOne sequenceTwo players |
	sequenceOne := CircularCollection contains: #(3 6 1 10).
	sequenceTwo := CircularCollection contains: #(2 5 9 12).
	players := OrderedCollection new.
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	players
		add: playerOne;
		add: playerTwo.
	playersCollection := CircularCollection contains: (OrderedCollection withAll: players).
	dicesCollection := OrderedCollection new.
	dicesCollection
		add: (Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne));
		add: (Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo)).
	game := Game playedBy: playersCollection throwing: dicesCollection spaces: 50.
	game move: playerOne by: (playerOne roll: dicesCollection).
	game move: playerTwo by: (playerTwo roll: dicesCollection).
	game move: playerOne by: (playerOne roll: dicesCollection).
	game move: playerTwo by: (playerTwo roll: dicesCollection).
	game move: playerOne by: (playerOne roll: dicesCollection).
	game move: playerTwo by: (playerTwo roll: dicesCollection).
	game move: playerOne by: (playerOne roll: dicesCollection).
	game move: playerTwo by: (playerTwo roll: dicesCollection).
	self assert: game hasFinished .
]
