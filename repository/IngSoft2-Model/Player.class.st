Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Player class >> assertLengthOf: aName [
	aName size < 2
		ifTrue: [ AssertionFailure signal: 'Name must have 2 characters or more' ]
]

{ #category : #'instance creation' }
Player class >> named: aName [
	self assertLengthOf: aName.
	^ self new initializeNamed: aName
]

{ #category : #initialization }
Player >> initializeNamed: aName [
	name := aName
]

{ #category : #accesing }
Player >> name [
	^ name
]

{ #category : #update }
Player >> roll: aDiceCollection [
	^ aDiceCollection sumNumbers:[ :each | each roll ]
]
