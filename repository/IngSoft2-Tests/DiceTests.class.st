Class {
	#name : #DiceTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTests >> testDiceCannotHaveMoreThan24FacesAndMoreThan4 [
	self 
		should: [ Dice faces: 25 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Faces must be less than 25' ];
		should: [ Dice faces: 3 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Faces must be more than 3' ]
]

{ #category : #tests }
DiceTests >> testRandomDiceCanRollAndTheResultIsBetween1AndFacesQuantity [
	| dice |
	dice := Dice faces: 6.
	self assert: ((1 to: 6) includes: dice roll)
]
