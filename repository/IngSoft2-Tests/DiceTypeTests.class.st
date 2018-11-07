Class {
	#name : #DiceTypeTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTypeTests >> testDeterministicDiceCannotHaveAWrongSequence [
		| sequence |
	sequence := CircularIterator contains:#(1 3 7).
	self should:[ Dice faces: 6 ofType: (DeterministicType rolling: sequence faces: 6)] 		  			           raise:AssertionFailure
		  withExceptionDo:[:signal | self assert: signal messageText equals: 'Invalid Sequence' ]
]

{ #category : #tests }
DiceTypeTests >> testDiceIsDetereministic [
	| dice sequence |
	sequence := CircularIterator contains:#(1 3 5).
	dice := Dice faces: 6 ofType: (DeterministicType rolling: sequence faces: 6).
	self assert: 1 equals: dice roll;
		assert: 3 equals: dice roll;
		assert: 5 equals: dice roll;
		assert: 1 equals: dice roll	
]

{ #category : #tests }
DiceTypeTests >> testDiceIsRandom [
	| dice |
	dice := Dice faces: 6 ofType: (RandomType rollingUntil:6).
	self assert: ((1 to: 6) includes: dice roll)
]
