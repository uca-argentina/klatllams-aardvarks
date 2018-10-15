Class {
	#name : #PlayerPositionsTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerPositionsTests >> testIsPosibleToChangeAPlayerPositionAndUpdates [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection.
	playersPosition updatePositionAndLapsOf: 'hector' to: 5 adding: 0.
	self deny: playersPosition topPlayer = 'ignacio'.
	self assert: playersPosition topPlayer equals: 'hector'
]

{ #category : #tests }
PlayerPositionsTests >> testIsPosibleToChangeAllPlayersBoardPositionToTheInitialPosition [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection.
	playersPosition updatePositionAndLapsOf: 'hector' to: 5 adding: 0.
	playersPosition updatePositionAndLapsOf: 'ignacio' to: 5 adding: 0.
	self assert:( playersPosition positionOf: 'hector') equals: 5.
	self assert:( playersPosition positionOf: 'ignacio') equals: 5.	
	playersPosition updateAllPlayersToInitialPosition.
	self assert:( playersPosition positionOf: 'hector') equals: 1.
	self assert:( playersPosition positionOf: 'ignacio') equals: 1.	
]

{ #category : #tests }
PlayerPositionsTests >> testIsPosibleToKnowEachPlayerPosition [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection.
	playersPosition updatePositionAndLapsOf: 'hector' to: 5 adding: 0.
	self assert: (playersPosition gamePositionOf: 'hector' ) equals: 1.
	self assert: (playersPosition gamePositionOf: 'ignacio' ) equals: 2.
]

{ #category : #tests }
PlayerPositionsTests >> testWhenCreatedAllPlayersMustHavePositionEqualsToOne [
	| playersPosition playersCollection|
	playersCollection  :=  #('hector' 'juan' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection .
	self assert: (playersPosition positionOf: 'hector') equals: 1.
	self assert: (playersPosition positionOf: 'juan') equals: 1.
	self assert: (playersPosition positionOf: 'ignacio') equals: 1.
	
]
