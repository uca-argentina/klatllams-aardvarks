Class {
	#name : #GameUserStoryTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameUserStoryTest >> testTwoPlayersPlayAndTheFirstOneWins [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces |
	sequenceOne := CircularCollection contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularCollection contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	spaces := {
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	SpeedUpSpace new.
	NoEffectSpace new.
	(MoonWalkSpace backwardsValue: 3).
	NoEffectSpace new.
	AtomicBombSpace new.
	WormHoleSpace new}.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	"The game starts"
	self assert: (game playerPositions positionOf: playerOne) equals: 1.
	self assert: (game playerPositions positionOf: playerOne) equals: 1.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game playerPositions positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game playerPositions positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game playerPositions positionOf: playerOne) equals: 9.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game playerPositions positionOf: playerTwo) equals: 7.
	self assert: (game playerPositions positionOf: playerOne) equals: 6.
	game move: playerOne.
	self assert: (game playerPositions positionOf: playerOne) equals: 1.
	self assert: (game playerPositions positionOf: playerTwo) equals: 1.		
	game move: playerTwo.
	self assert: (game playerPositions positionOf: playerTwo) equals: 6.
	game move: playerOne.
	self assert: (game playerPositions positionOf: playerOne) equals: 9.
	game move: playerTwo.
	self assert: (game playerPositions positionOf: playerTwo) equals: 8.
	game move: playerOne.
	self assert: (game playerPositions positionOf: playerOne) equals: 1.
	
	self assert: game hasFinished ;
		  assert: (game playerPositions gamePositionOf: playerOne) equals:1;
		  assert: (game playerPositions gamePositionOf: playerTwo) equals:2.
]
