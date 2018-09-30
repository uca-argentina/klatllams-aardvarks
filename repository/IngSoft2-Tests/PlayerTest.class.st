Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testAPlayerCanRollACollectionOfDicesAndResultIsLessOrEqual11 [
	"test if a player can roll a collection of dices"

	| player diceList |
	player := Player name: 'hector'.
	diceList := OrderedCollection new.
	diceList
		add: (Dice faces: 5);
		add: (Dice faces: 6).
	self assert: (player roll: diceList) <= 11
]

{ #category : #tests }
PlayerTest >> testPlayerExistsAndHasAName [
	"just a player creation test"

	| player |
	player := Player name: 'Hector'.
	self assert: player name equals: 'Hector'
]

{ #category : #tests }
PlayerTest >> testPlayerNameCannotHaveLessThan2Characters [
	"Test to check player name must be 2 characters or more"

	| player |
	self should: [ player := Player name: '' ] raise: AssertionFailure
]
