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
	lastCard:		<Object>
	owner:		<Object>


    Implementation Points
"
Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'lastCard',
		'lastCardIsSet'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #updating }
RedoCard >> addLastCard: aCard [
	lastCard := aCard.
	lastCardIsSet := true
]

{ #category : #affecting }
RedoCard >> affect: aPlayer on: aBoard [
	lastCard affect: aPlayer on: aBoard

]

{ #category : #asserting }
RedoCard >> assertCanCancelAnotherCard [
	lastCardIsSet
		ifTrue: [ ^ lastCard assertCanCancelAnotherCard ].
	AssertionFailure signal: 'This card cannot cancel another card'
]

{ #category : #asserting }
RedoCard >> assertCardNeedsLastCard: aCardsCollection [
	aCardsCollection notEmpty
		ifTrue: [ self addLastCard: aCardsCollection first ]
		ifFalse: [ AssertionFailure signal: 'Redo can be used if a Card was Used' ]
]

{ #category : #initialization }
RedoCard >> initializeOwnedBy: aPlayer [
	owner := aPlayer.
	lastCardIsSet := false
]

{ #category : #asserting }
RedoCard >> isTransient [
	lastCardIsSet
		ifTrue: [ ^ lastCard isTransient ].
	^ true
]
