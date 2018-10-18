Class {
	#name : #BoardSpacesTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardSpacesTest >> testAMoonWalkSpaceWithBackwardsValue4MovesPlayerBackwardsBy4 [
	| board spaces |
	spaces := {NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	(MoonWalkSpace backwardsValue: 4)}.
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 4.
	board moveAndAffect: 'ignacio' by: 5.
	self assert: (board playerPositions positionOf: 'hector') equals: 1.
]

{ #category : #tests }
BoardSpacesTest >> testANoEffectSpaceCannotChangeAPlayerPosition [
	| board spaces |
	spaces := BoardTest createNoEffectSpacesCollection  	.
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 5.
   self assert: (board playerPositions positionOf: 'hector') equals: 6
]

{ #category : #tests }
BoardSpacesTest >> testAtomicBombSpaceAndMoveEveryOneToInitialPosition [
	| board spaces |
	spaces := {NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	AtomicBombSpace new}.
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 4.
	board moveAndAffect: 'ignacio' by: 5.
	self
		assert: (board playerPositions positionOf: 'hector') equals: 1;
		assert: (board playerPositions positionOf: 'ignacio') equals: 1
]

{ #category : #tests }
BoardSpacesTest >> testSpeedUpHoleSpaceAndMoveAPlayerForwardsBy4 [
	| board spaces |
	spaces := {NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	SpeedUpSpace new}.
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 4.
	board moveAndAffect: 'ignacio' by: 5.
	self
		assert: (board playerPositions positionOf: 'hector') equals: 5;
		assert: (board playerPositions positionOf: 'ignacio') equals: 4
]

{ #category : #tests }
BoardSpacesTest >> testWarmHoleSpaceAndMoveAPlayerBackwardsBy4 [
	| board spaces |
	spaces := {NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	NoEffectSpace new.
	WormHoleSpace new}.
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 4.
	board moveAndAffect: 'ignacio' by: 5.
	self
		assert: (board playerPositions positionOf: 'hector') equals: 5;
		assert: (board playerPositions positionOf: 'ignacio') equals: 2
]
