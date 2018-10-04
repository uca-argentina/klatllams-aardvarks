Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> assertLengthOf: aName [
	aName size < 2
		ifTrue: [ AssertionFailure signal: 'Name must have 2 characters or more' ]
]

{ #category : #'instance creation' }
Player class >> named: aName [
	self assertLengthOf: aName.
	^ self new initializeWithName: aName
]

{ #category : #initialization }
Player >> initializeWithName: aName [
	name := aName
]

{ #category : #accesing }
Player >> name [
	^ name
]

{ #category : #update }
Player >> roll: aDiceCollection [
	^ aDiceCollection inject: 0 into:[ :sum :each | sum + each roll ]
]
