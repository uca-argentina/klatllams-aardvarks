Class {
	#name : #BoardSpacesTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardSpacesTest >> testAMoonWalkSpaceCanHaveABackwardsValueRandom [
	self assert: ((1 to: 10) includes: MoonWalkSpace generateValidBackwardsValue).
]

{ #category : #tests }
BoardSpacesTest >> testAMoonWalkSpaceCannotHaveABackwardsValueLessThan1OrMoreThan10 [
	self
		should: [ MoonWalkSpace backwardsValue: 0 ] raise: AssertionFailure;
		should: [ MoonWalkSpace backwardsValue: 11 ] raise: AssertionFailure
]

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
	self assert: (board storyElements positionOf: 'hector') equals: 1.
]

{ #category : #tests }
BoardSpacesTest >> testANoEffectSpaceCannotChangeAPlayerPosition [
	| board spaces |
	spaces := BoardTest createNoEffectSpacesCollection  	.
	board := Board playedBy: #('hector' 'ignacio') composedBy: spaces.
	board moveAndAffect: 'hector' by: 5.
   self assert: (board storyElements positionOf: 'hector') equals: 6
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
		assert: (board storyElements positionOf: 'hector') equals: 1;
		assert: (board storyElements positionOf: 'ignacio') equals: 1
]

{ #category : #tests }
BoardSpacesTest >> testCardSpaceAssignsACardToAPlayer [
	| spaces players board card |
	spaces := {CardSpace new.
	CardSpace new.
	CardSpace new.
	CardSpace new.
	CardSpace new.
	CardSpace new} asOrderedCollection.
	players := {Player named: 'Carrot' . Player named: 'Nacho'} asOrderedCollection .
	board := Board playedBy: players composedBy: spaces.
	(spaces first) affect: players first on: board.
	card := board inactiveCards first.
	self assert: (card ownedBy) equals: (players first)
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
		assert: (board storyElements positionOf: 'hector') equals: 5;
		assert: (board storyElements positionOf: 'ignacio') equals: 4
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
		assert: (board storyElements positionOf: 'hector') equals: 5;
		assert: (board storyElements positionOf: 'ignacio') equals: 2
]
