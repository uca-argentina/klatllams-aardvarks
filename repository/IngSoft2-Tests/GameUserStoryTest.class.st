Class {
	#name : #GameUserStoryTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameUserStoryTest >> testTwoPlayersPlayAndTheFirstOneWins [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces accelerationCard redoCard repeatCard cancellationCard overloadCard speedCard |
	sequenceOne := CircularIterator contains: #(1 1 1 1 4 4 9 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 2 2 2 4 5 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Hector'.
	playerTwo := Player named: 'Ignacio'.
	accelerationCard := AccelerationCard ownedBy: playerOne.
	redoCard := RedoCard ownedBy: playerOne.
	repeatCard := RepeatCard ownedBy: playerOne.
	cancellationCard := CancellationCard ownedBy: playerTwo.
	overloadCard := OverloadCard ownedBy: playerTwo.
	speedCard := SpeedCard ownedBy: playerTwo.
	spaces := {NoEffectSpace new.
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
	playerOne
		addNewCard: accelerationCard;
		addNewCard: redoCard;
		addNewCard: repeatCard.
	playerTwo
		addNewCard: cancellationCard;
		addNewCard: overloadCard;
		addNewCard: speedCard.
	"The game starts"
	playerOne play: accelerationCard in: game.	"allPlayers acceleration + 1"
	self assert: (game gameStatus positionOf: playerOne) equals: 1.
	self assert: (game gameStatus positionOf: playerTwo) equals: 1.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 4.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 4.
	playerTwo play: cancellationCard in: game cancelling: accelerationCard.	"acceleration cancelled"
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 7.
	self assert: (game gameStatus positionOf: playerTwo) equals: 1.
	playerOne play: repeatCard in: game affecting: playerOne.
	self assert: (game gameStatus positionOf: playerTwo) equals: 8.
	self assert: (game gameStatus lapsOf: playerTwo) equals: -1.
	playerOne play: redoCard in: game affecting: playerOne.
	self assert: (game gameStatus positionOf: playerTwo) equals: 5.
	self assert: (game hasTheTurn: playerTwo).
	playerTwo play: overloadCard in: game affecting: playerOne.
	playerTwo play: speedCard in: game affecting: playerTwo.
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 1.
	self assert: (game gameStatus positionOf: playerOne) equals: 1.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 9.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 6.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 1.
	self assert: (game gameStatus lapsOf: playerOne) equals: 2.
	self assert: (game gameStatus gamePositionOf: playerOne) equals: 1.
	self assert: (game gameStatus gamePositionOf: playerTwo) equals: 2.
	self assert: game hasFinished
]
