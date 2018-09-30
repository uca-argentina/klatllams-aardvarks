Class {
	#name : #DiceTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTests >> testDiceCannotHaveMoreThan24FacesAndMoreThan4 [
	"Test for checking dice instance creation 3<facesQuantity<25 "

	self should: [ Dice faces: 25 ] raise: AssertionFailure.
	self should: [ Dice faces: 3 ] raise: AssertionFailure
]

{ #category : #tests }
DiceTests >> testDiceExistsAndHas4Faces [
	"Check if a dice has the facesQuantity correct"

	| dice |
	dice := Dice faces: 4.
	self assert: dice facesQuantity equals: 4
]

{ #category : #tests }
DiceTests >> testRandomDiceCanRollAndTheResultIsBetween1AndFacesQuantity [
	"A non deterministic dice roll test"

	| dice |
	dice := Dice faces: 6.
	self assert: ((1 to: dice facesQuantity) includes: dice roll)
]
