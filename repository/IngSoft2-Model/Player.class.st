"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two

- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	name:		<Object>


    Implementation Points
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'myCards'
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

{ #category : #action }
Player >> addNewCard: aCard [
	myCards add: aCard
]

{ #category : #initialization }
Player >> initializeNamed: aName [
	name := aName.
	myCards := OrderedCollection new.
	
]

{ #category : #accesing }
Player >> name [
	^ name
]

{ #category : #action }
Player >> play: aCard in: aGame [
	myCards
		detect: [ :each | aCard = each ]
		ifFound: [ aGame add: aCard.
			myCards remove: aCard ]
		ifNone: [ AssertionFailure signal: 'Wrong card' ]
]

{ #category : #action }
Player >> play: aCard in: aGame affecting: aPlayer [
	myCards
		detect: [ :each | aCard = each ]
		ifFound: [ aGame add: aCard affecting: aPlayer.
					  myCards remove: aCard ]
		ifNone: [ AssertionFailure signal: 'Wrong card' ]
]

{ #category : #action }
Player >> play: aCard in: aGame cancelling: anotherCard [
	myCards
		detect: [ :each | aCard = each ]
		ifFound: [ aGame add: aCard affectingCard: anotherCard.
			myCards remove: aCard ]
		ifNone: [ AssertionFailure signal: 'Wrong card' ]
]

{ #category : #action }
Player >> roll: aDiceCollection [
	^ aDiceCollection sumNumbers:[ :each | each roll ]
]
