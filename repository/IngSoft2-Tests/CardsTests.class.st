Class {
	#name : #CardsTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardsTests >> testAccelerationCardAffectsAllPlayers [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	card := AccelerationCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game.
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 6
]

{ #category : #tests }
CardsTests >> testAllKindsOfCardsCanBeCreated [
	AccelerationCard new.
	CancellationCard new.
	OverloadCard new.
	RedoCard new.
	RepeatCard new.
	SpeedCard new.
	
]

{ #category : #tests }
CardsTests >> testCancellationCardAffectsAnotherCard [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card cancellationCard |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	card := SpeedCard ownedBy: playerOne.
	cancellationCard := CancellationCard ownedBy: playerTwo.
	playerOne addNewCard: card.
	playerTwo addNewCard: cancellationCard.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	playerTwo
		play: playerTwo myCards first
		in: game
		cancelling: game activeCardsInfo first card.
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 5.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 7
]

{ #category : #tests }
CardsTests >> testOverloadCardAffectsAPlayer [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	card := OverloadCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 5.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 5
]

{ #category : #tests }
CardsTests >> testRedoAccelerationCard [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card redoCard |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	redoCard := RedoCard ownedBy: playerOne.
	playerOne addNewCard: redoCard.
	card := AccelerationCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game.
	game move: playerOne.
	playerOne play: playerOne myCards first in: game.
	self assert: (game gameStatus positionOf: playerOne) equals: 6.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 1
]

{ #category : #tests }
CardsTests >> testRedoCancellationCard [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces cancellingCard redoCard speedCard overloadCard |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := {BoardTest createNoEffectSpacesCollection.
	SpeedUpSpace new} flattened.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	redoCard := RedoCard ownedBy: playerOne.
	playerOne addNewCard: redoCard.
	speedCard := SpeedCard ownedBy: playerOne.
	playerOne addNewCard: speedCard.
	cancellingCard := CancellationCard ownedBy: playerTwo.
	playerTwo addNewCard: cancellingCard.
	overloadCard := OverloadCard ownedBy: playerTwo.
	playerTwo addNewCard: overloadCard.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	playerTwo play: playerTwo myCards first in: game affecting: playerOne.
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 4.
	self assert: (game hasTheTurn: playerOne).
	playerTwo
		play: playerTwo myCards first
		in: game
		cancelling: game activeCardsInfo first card.
	game move: playerOne.
	playerOne
		play: playerOne myCards first
		in: game
		cancelling: game activeCardsInfo first card.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 8.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 6
]

{ #category : #tests }
CardsTests >> testRedoOveloadCard [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card redoCard |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	redoCard := RedoCard ownedBy: playerOne.
	playerOne addNewCard: redoCard.
	card := OverloadCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	self assert: (game gameStatus positionOf: playerOne) equals: 5.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3
]

{ #category : #tests }
CardsTests >> testRedoRepeatCard [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card redoCard |
	sequenceOne := CircularIterator contains: #(7 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := {BoardTest createNoEffectSpacesCollection.
	SpeedUpSpace new} flattened.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	redoCard := RedoCard ownedBy: playerOne.
	playerOne addNewCard: redoCard.
	card := RepeatCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 4.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	self assert: (game gameStatus positionOf: playerOne) equals: 6.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 7
]

{ #category : #tests }
CardsTests >> testRedoSpeedCard [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card redoCard |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	redoCard := RedoCard ownedBy: playerOne.
	playerOne addNewCard: redoCard.
	card := SpeedCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	self assert: (game gameStatus positionOf: playerOne) equals: 5.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 1
]

{ #category : #tests }
CardsTests >> testRepeatCardAffectsAPlayer [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	card := RepeatCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 5
]

{ #category : #tests }
CardsTests >> testSpeedCardAffectsAPlayer [
	| game playerOne playerTwo sequenceOne sequenceTwo diceOne diceTwo spaces card |
	sequenceOne := CircularIterator contains: #(1 1 1 2 1 5 3 1 6).
	sequenceTwo := CircularIterator contains: #(1 1 1 2 2 4 1 1 6).
	diceOne := Dice faces: 10 ofType: (DeterministicType rolling: sequenceOne faces: 10).
	diceTwo := Dice faces: 12 ofType: (DeterministicType rolling: sequenceTwo faces: 12).
	playerOne := Player named: 'Carrot'.
	playerTwo := Player named: 'Nacho'.
	spaces := BoardTest createNoEffectSpacesCollection.
	game := Game
		playedBy:
			{playerOne.
			playerTwo}
		throwing:
			{diceOne.
			diceTwo}
		boardComposedBy: spaces
		totalLaps: 2.
	card := SpeedCard ownedBy: playerOne.
	playerOne addNewCard: card.
	self assert: (game hasTheTurn: playerOne).
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 3.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 3.
	self assert: (game hasTheTurn: playerOne).
	playerOne play: playerOne myCards first in: game affecting: playerTwo.
	game move: playerOne.
	self assert: (game gameStatus positionOf: playerOne) equals: 5.
	self assert: (game hasTheTurn: playerTwo).
	game move: playerTwo.
	self assert: (game gameStatus positionOf: playerTwo) equals: 8
]
