Class {
	#name : #CircularCollectionTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CircularCollectionTests >> testAnEmptyCircularCollectionShouldRaiseAnException [
	| players |
	players := CircularCollection new.
	self should: [ players next ] raise: AssertionFailure
]

{ #category : #tests }
CircularCollectionTests >> testCanCreateACircularCollectionWithPlayers [
	| players |
	players := CircularCollection new.
	players
		add: (Player name: 'John');
		add: (Player name: 'Peter').
	self
		assert: players next name equals: 'John';
		assert: players next name equals: 'Peter'
]

{ #category : #tests }
CircularCollectionTests >> testCanRemoveAPlayerInACircularCollectionWithPlayers [
	| players playerJohn |
	players := CircularCollection new.
	playerJohn := Player name: 'John'.
	players
		add: playerJohn;
		add: (Player name: 'Peter').
	self assert: players size equals: 2.
	players remove: playerJohn.
	self assert: players size equals: 1
]

{ #category : #tests }
CircularCollectionTests >> testCircularCollectionGoesBackToTheFirstPosition [
	| players |
	players := CircularCollection new.
	players
		add: (Player name: 'John');
		add: (Player name: 'Peter').
	self
		assert: players next name equals: 'John';
		assert: players next name equals: 'Peter';
		assert: players next name equals: 'John'
]
