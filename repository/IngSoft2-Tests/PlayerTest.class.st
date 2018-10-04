Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testAPlayerCanRollACollectionOfDicesAndResultIsLessOrEqual11 [
	| player dicesCollection |
	player := Player named: 'hector'.
	dicesCollection := OrderedCollection new.
	dicesCollection
		add: (Dice faces: 5);
		add: (Dice faces: 6).
	self assert: (player roll: dicesCollection) <= 11
]

{ #category : #tests }
PlayerTest >> testPlayerExistsAndHasAName [
	| player |
	player := Player named: 'Hector'.
	self assert: player name equals: 'Hector'
]

{ #category : #tests }
PlayerTest >> testPlayerNameCannotHaveLessThan2Characters [
	| player |
	self should: [ player := Player named: '' ]
		  raise: AssertionFailure
		  withExceptionDo: [ :signal | self assert: signal messageText equals: 'Name must have 2 characters or more' ]
]
