Class {
	#name : #DeterministicType,
	#superclass : #Object,
	#instVars : [
		'rollSequence'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
DeterministicType class >> assertIsValid: aNumberSequence withDiceFaces: aQuantity [
		aNumberSequence elements detect: [ :each | each > aQuantity ]
		                   ifFound: [ AssertionFailure signal: 'Invalid Sequence' ]
	
]

{ #category : #'instance creation' }
DeterministicType class >> rolling: aNumberSequence faces: aQuantity [
     self assertIsValid: aNumberSequence withDiceFaces: aQuantity .
	^ self new initializeRolling: aNumberSequence
]

{ #category : #initialization }
DeterministicType >> initializeRolling: aNumberSequence [
	rollSequence:= aNumberSequence
]

{ #category : #action }
DeterministicType >> roll [
	^ rollSequence next
]
