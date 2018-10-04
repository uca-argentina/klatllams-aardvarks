Class {
	#name : #DeterministicType,
	#superclass : #Object,
	#instVars : [
		'name',
		'rollSequence'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
DeterministicType class >> rolling: aSequence [
	^ self new initializeWithRollValues: aSequence
]

{ #category : #asserting }
DeterministicType >> assertValidSequence: aQuantity [
	(rollSequence elements)
		do: [ :each | 
			each > aQuantity
				ifTrue: [ AssertionFailure signal: 'Invalid Sequence' ] ]
]

{ #category : #initialization }
DeterministicType >> initializeWithRollValues: aCircularCollection [
	name := 'deterministic'.
	rollSequence:= aCircularCollection
]

{ #category : #accessing }
DeterministicType >> name [
	^ name
]

{ #category : #action }
DeterministicType >> roll: aDice [
	^ aDice deterministicRoll: rollSequence next
]
