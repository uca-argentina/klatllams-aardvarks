Class {
	#name : #DiceTypeTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTypeTests >> testDiceIsDetereministic [
	| dice sequence |
	sequence := CircularCollection new.
	sequence addAll: #(1 3 5).
	dice := Dice faces: 6 ofType: (DeterministicType rollValues: sequence).
	self assert: dice type name equals: 'deterministic'.
	self assert: 1 equals: dice roll;
		assert: 3 equals: dice roll;
		assert: 5 equals: dice roll;
		assert: 1 equals: dice roll	
]

{ #category : #tests }
DiceTypeTests >> testDiceIsRandom [
	| dice |
	dice := Dice faces: 6 ofType: RandomType new.
	self assert: dice type name equals: 'random'.
	self assert: ((1 to: dice facesQuantity) includes: dice roll)
]
