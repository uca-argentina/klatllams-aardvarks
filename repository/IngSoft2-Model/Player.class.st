Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> name: aName [
	aName size < 2
		ifTrue: [ AssertionFailure signal: 'Name must have 2 characters or more' ].
	^ self new initializeWithName: aName
]

{ #category : #comparing }
Player >> <= aPlayer [
	^ self name <= aPlayer name
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
Player >> rollDices: aDiceCollection [
	| sum |
	sum := 0.
	aDiceCollection do: [ :each | sum := sum + each roll ].
	^ sum
]
