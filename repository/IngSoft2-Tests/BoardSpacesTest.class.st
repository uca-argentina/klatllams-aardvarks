Class {
	#name : #BoardSpacesTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardSpacesTest >> testANoEffectSpaceCannotChangeAPlayerPosition [
	| board spaces |
	spaces := BoardTest createNoEffectSpacesCollection.	
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 5.
   self assert: (board playerPositions positionOf: 'hector') equals: 6
]
