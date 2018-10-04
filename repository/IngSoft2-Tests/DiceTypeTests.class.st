Class {
	#name : #DiceTypeTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTypeTests >> testDiceIsDetereministic [
	| dice sequence |
	sequence := CircularCollection contains:#(1 3 5).
	dice := Dice faces: 6 ofType: (DeterministicType rolling: sequence).
	self assert: 1 equals: dice roll;
		assert: 3 equals: dice roll;
		assert: 5 equals: dice roll;
		assert: 1 equals: dice roll	
]

{ #category : #tests }
DiceTypeTests >> testDiceIsRandom [
	| dice |
	dice := Dice faces: 6 ofType: RandomType new.
	self assert: ((1 to: 6) includes: dice roll)
]
