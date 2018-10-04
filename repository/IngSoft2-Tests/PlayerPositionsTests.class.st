Class {
	#name : #PlayerPositionsTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerPositionsTests >> testIsNotPosibleToChangeAPlayerPositionIfQuantityIsLessThanOne [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection.
	self
		should: [ playersPosition updatePositionOf: 'hector' by: 0 ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'You cannot move a player a negative quantity' ]
]

{ #category : #tests }
PlayerPositionsTests >> testIsPosibleToChangeAPlayerPositionAndUpdates [
	| playersCollection playersPosition |
	playersCollection := #('hector' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection.
	playersPosition updatePositionOf: 'hector' by: 5.
	self deny: playersPosition topPlayer = 'ignacio'.
	self assert: playersPosition topPlayer equals: 'hector'
]

{ #category : #tests }
PlayerPositionsTests >> testWhenCreatedAllPlayersMustHavePositionEqualsToZero [
	| playersPosition playersCollection|
	playersCollection  :=  #('hector' 'juan' 'ignacio').
	playersPosition := PlayerPositions players: playersCollection .
	self assert: (playersPosition positionOf: 'hector') equals: 0.
	self assert: (playersPosition positionOf: 'juan') equals: 0.
	self assert: (playersPosition positionOf: 'ignacio') equals: 0.
	
]
