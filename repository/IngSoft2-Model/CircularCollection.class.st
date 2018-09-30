Class {
	#name : #CircularCollection,
	#superclass : #TestCase,
	#instVars : [
		'list',
		'currentPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #adding }
CircularCollection >> add: anElement [
	list add: anElement
]

{ #category : #adding }
CircularCollection >> addAll: aCollection [
	(aCollection asOrderedCollection ) do: [ :each | self add: each ]
]

{ #category : #asserting }
CircularCollection >> assertNotEmptyList [
	list isEmpty 
		ifTrue: [ AssertionFailure signal: 'The list is empty' ]
]

{ #category : #initialization }
CircularCollection >> initialize [
	list := OrderedCollection new.
	currentPosition := 0
]

{ #category : #accesing }
CircularCollection >> list [
	^ list
]

{ #category : #accessing }
CircularCollection >> next [
	self assertNotEmptyList.
	 self updateCurrentPosition .
	^ list at:currentPosition.
]

{ #category : #removing }
CircularCollection >> remove: anElement [
	list remove: anElement
]

{ #category : #accessing }
CircularCollection >> size [
	^ list size
]

{ #category : #updating }
CircularCollection >> updateCurrentPosition [
	currentPosition + 1 > list size
		ifTrue: [ currentPosition := 1 ]
		ifFalse: [ currentPosition := currentPosition + 1 ]
]
