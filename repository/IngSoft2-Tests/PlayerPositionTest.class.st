Class {
	#name : #PlayerPositionTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerPositionTest >> testAPlayerPositionLapExistsAndHasPositionAndLap [
	|playerPosition|
	playerPosition := PlayerPosition player:'hector' position: 1 laps: 0.
	self assert: playerPosition position equals: 1.
	self assert: playerPosition lap equals: 0.
	self assert: playerPosition player equals: 'hector'.
	
]
