Class {
	#name : #CircularCollection,
	#superclass : #Object,
	#instVars : [
		'currentPosition',
		'elements'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
CircularCollection class >> assertNotEmpty: aCollection [
	aCollection isEmpty
		ifTrue: [ AssertionFailure signal: 'The collection is empty' ]
]

{ #category : #'instance creation' }
CircularCollection class >> contains: aCollection [
	self assertNotEmpty: aCollection.
	^ self new initializeContaining: aCollection
]

{ #category : #accessing }
CircularCollection >> elements [
	^ elements
]

{ #category : #initialization }
CircularCollection >> initializeContaining: aCollection [
	elements := aCollection.
	currentPosition := 0
]

{ #category : #accessing }
CircularCollection >> next [
	self updateCurrentPosition.
	^ elements at: currentPosition
]

{ #category : #updating }
CircularCollection >> updateCurrentPosition [
	currentPosition + 1 > elements size
		ifTrue: [ currentPosition := 1 ]
		ifFalse: [ currentPosition := currentPosition + 1 ]
]
