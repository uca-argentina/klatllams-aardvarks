Class {
	#name : #DiceStateTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceStateTests >> testDiceIsDetereministic [
	| dice |
	dice := Dice facesQuantity: 6 state: (DeterministicDiceState new).
	
	self assert: (dice state name) equals: 'deterministic' .	
	self assert: 4 equals: dice roll.
]

{ #category : #tests }
DiceStateTests >> testDiceIsRandom [
	| dice |
	dice := Dice facesQuantity: 6 state: (RandomDiceState new).
	
	self assert: (dice state name) equals: 'random' .	
	self assert: (dice faces includes: dice roll).
]
