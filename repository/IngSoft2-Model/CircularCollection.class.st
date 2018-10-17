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
	currentPosition:		<Object>
	elements:		<Object>


    Implementation Points
"
Class {
	#name : #CircularCollection,
	#superclass : #Object,
	#instVars : [
		'currentPosition',
		'elements',
		'turns'
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
	^ self new initializeContaining: aCollection initializeStartingAt: 0
]

{ #category : #'instance creation' }
CircularCollection class >> contains: aCollection startingAt: aPosition [ 
	^self new initializeContaining: aCollection initializeStartingAt: aPosition
]

{ #category : #accessing }
CircularCollection >> elements [
	^ elements
]

{ #category : #initialization }
CircularCollection >> initializeContaining: aCollection initializeStartingAt: aPosition [
	elements := aCollection.
	currentPosition := aPosition.
	turns := 0
]

{ #category : #accessing }
CircularCollection >> next [
	^self nextBy: 1
]

{ #category : #accessing }
CircularCollection >> nextBy: aQuantity [
	(aQuantity abs) timesRepeat:[ self updateCurrentPositionForward ].
	^ elements at: currentPosition
]

{ #category : #accessing }
CircularCollection >> previous [
	^ self previousBy: 1
]

{ #category : #accessing }
CircularCollection >> previousBy: aQuantity [
	(aQuantity abs) timesRepeat:[ self updateCurrentPositionBackwards].
	^ elements at: currentPosition
]

{ #category : #accessing }
CircularCollection >> turns [
	^ turns
]

{ #category : #updating }
CircularCollection >> updateCurrentPositionBackwards [
	currentPosition - 1 < 1
		ifTrue: [ currentPosition := elements size .
					 turns := turns - 1 ]
		ifFalse: [ currentPosition := currentPosition - 1 ]
]

{ #category : #updating }
CircularCollection >> updateCurrentPositionForward [
	currentPosition + 1 > elements size
		ifTrue: [ currentPosition := 1 .
					 turns := turns + 1 ]
		ifFalse: [ currentPosition := currentPosition + 1 ]
]
