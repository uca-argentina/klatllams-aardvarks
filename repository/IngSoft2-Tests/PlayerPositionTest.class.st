Class {
	#name : #PlayerPositionTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerPositionTest >> testAPlayerPositionExistsAndIsPossibleToUpdateThePosition [
	|playerPosition|
	playerPosition := PlayerPositionLap player:'hector'.
	self assert: playerPosition position equals: 0.
	self assert: playerPosition player equals: 'hector'.
	playerPosition updateThePositionTo: 5.
	self assert: playerPosition position equals: 5.
]
