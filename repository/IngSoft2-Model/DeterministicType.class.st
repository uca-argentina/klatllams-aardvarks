Class {
	#name : #DeterministicType,
	#superclass : #Object,
	#instVars : [
		'rollSequence'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
DeterministicType class >> rolling: aNumberSequence [
	^ self new initializeRolling: aNumberSequence
]

{ #category : #asserting }
DeterministicType >> assertValidSequence: aQuantity [
	rollSequence elements detect: [ :each | each > aQuantity ]
		                   ifFound: [ AssertionFailure signal: 'Invalid Sequence' ]
]

{ #category : #initialization }
DeterministicType >> initializeRolling: aNumberSequence [
	rollSequence:= aNumberSequence
]

{ #category : #action }
DeterministicType >> roll: aDice [
	^ aDice deterministicRoll: rollSequence next
]
