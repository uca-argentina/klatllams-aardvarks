Class {
	#name : #FullScenarioTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
FullScenarioTest >> testTwoPlayerPlayAndTheFirstOneWins [
	| game playersList dicesList playerOne playerTwo sequenceOne sequenceTwo |
	sequenceOne := CircularCollection new.
	sequenceOne addAll: #(3 6 1 10).
	sequenceTwo := CircularCollection new.
	sequenceTwo addAll: #(2 5 9 12).
	playersList := CircularCollection new.
	dicesList := OrderedCollection new.
	playerOne := Player name: 'Hector'.
	playerTwo := Player name: 'Ignacio'.
	playersList
		add: playerOne;
		add: playerTwo.
	dicesList
		add: (Dice faces: 10 ofType: (DeterministicType rollValues: sequenceOne));
		add: (Dice faces: 12 ofType: (DeterministicType rollValues: sequenceTwo)).
	game := Game playedBy: playersList throwing: dicesList spaces: 50.
	game move: playerOne by: (playerOne roll: dicesList).
	game move: playerTwo by: (playerTwo roll: dicesList).
	game move: playerOne by: (playerOne roll: dicesList).
	game move: playerTwo by: (playerTwo roll: dicesList).
	game move: playerOne by: (playerOne roll: dicesList).
	game move: playerTwo by: (playerTwo roll: dicesList).
	game move: playerOne by: (playerOne roll: dicesList).
	game move: playerTwo by: (playerTwo roll: dicesList).
	self assert: game hasFinished.
	self should: [ game move: playerOne by: (playerOne roll: dicesList) ] raise: AssertionFailure
]
