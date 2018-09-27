Class {
	#name : #DiceTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTests >> testDiceCanRollAndTheResultIsBetween1AndFacesQuantity [
	"A non deterministic dice roll test"

	| dice |
	dice := Dice facesQuantity: 6.
	self assert: dice roll <= 6
]

{ #category : #tests }
DiceTests >> testDiceCannotHaveMoreThan24FacesAndMoreThan4 [
	"Test for checking dice instance creation 3<facesQuantity<25 "

	self should: [ Dice facesQuantity: 25 ] raise: AssertionFailure.
	self should: [ Dice facesQuantity: 3 ] raise: AssertionFailure
]

{ #category : #tests }
DiceTests >> testDiceExistsAndHas4Faces [
	"Check if a dice has the facesQuantity correct"

	| dice |
	dice := Dice facesQuantity: 4.
	self assert: dice facesQuantity equals: 4
]

{ #category : #tests }
DiceTests >> testDiceHas5FacesAndHasFaceNumber2 [
	"Check if a number is included in dice faces"

	| dice |
	dice := Dice facesQuantity: 5.
	self
		assert: dice facesQuantity equals: 5;
		assert: (dice faces includes: 2)
]
