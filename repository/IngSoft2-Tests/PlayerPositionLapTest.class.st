Class {
	#name : #PlayerPositionLapTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerPositionLapTest >> testAPlayerPositionCanBeSetToTheFirstPosition [
	|playerPosition|
	playerPosition := PlayerPositionLap player:'hector'.
	self assert: playerPosition position equals: 1.
	playerPosition updateThePositionTo: 5.
	self assert: playerPosition position equals: 5.
	playerPosition updateToInitialPosition.
	self assert: playerPosition position equals: 1.
]

{ #category : #tests }
PlayerPositionLapTest >> testAPlayerPositionLapExistsAndIsPossibleToUpdateThePositionAndLap [
	|playerPosition|
	playerPosition := PlayerPositionLap player:'hector'.
	self assert: playerPosition position equals: 1.
	self assert: playerPosition lap equals: 0.
	self assert: playerPosition player equals: 'hector'.
	playerPosition updateThePositionTo: 5.
	self assert: playerPosition position equals: 5.
	playerPosition updateLapBy: 2.
	self assert: playerPosition lap equals: 2.
]
