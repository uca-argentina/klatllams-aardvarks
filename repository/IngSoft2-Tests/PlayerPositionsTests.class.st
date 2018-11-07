Class {
	#name : #PlayerPositionsTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerPositionsTests >> testIsPosibleToChangeAPlayerPositionAndUpdates [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := GameStatus players: playersCollection.
	playersPosition updatePositionAndLapsOf: 'hector' to: 5 adding: 0.
	self deny: playersPosition topPlayer = 'ignacio'.
	self assert: playersPosition topPlayer equals: 'hector'.
	playersPosition updatePositionAndLapsOf: 'ignacio' to: 10 adding: 0.
	self assert: playersPosition topPlayer equals: 'ignacio'.
	self deny: playersPosition topPlayer = 'hector'.
]

{ #category : #tests }
PlayerPositionsTests >> testIsPosibleToKnowEachPlayerPosition [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := GameStatus players: playersCollection.
	playersPosition updatePositionAndLapsOf: 'hector' to: 5 adding: 0.
	self assert: (playersPosition gamePositionOf: 'hector' ) equals: 1.
	self assert: (playersPosition gamePositionOf: 'ignacio' ) equals: 2.
]

{ #category : #tests }
PlayerPositionsTests >> testWhenCreatedAllPlayersMustHavePositionEqualsToOne [
	| playersPosition playersCollection|
	playersCollection  :=  #('hector' 'juan' 'ignacio').
	playersPosition := GameStatus players: playersCollection .
	self assert: (playersPosition positionOf: 'hector') equals: 1.
	self assert: (playersPosition positionOf: 'juan') equals: 1.
	self assert: (playersPosition positionOf: 'ignacio') equals: 1.
	
]
