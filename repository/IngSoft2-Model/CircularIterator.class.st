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
	#name : #CircularIterator,
	#superclass : #Object,
	#instVars : [
		'currentPosition',
		'elements',
		'turns'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
CircularIterator class >> assertNotEmpty: aCollection [
	aCollection isEmpty
		ifTrue: [ AssertionFailure signal: 'The collection is empty' ]
]

{ #category : #'instance creation' }
CircularIterator class >> contains: aCollection [
	self assertNotEmpty: aCollection.
	^ self new initializeContaining: aCollection initializeStartingAt: 0
]

{ #category : #'instance creation' }
CircularIterator class >> contains: aCollection startingAt: aPosition [ 
	^self new initializeContaining: aCollection initializeStartingAt: aPosition
]

{ #category : #accessing }
CircularIterator >> elements [
	^ elements
]

{ #category : #initialization }
CircularIterator >> initializeContaining: aCollection initializeStartingAt: aPosition [
	elements := aCollection.
	currentPosition := aPosition.
	turns := 0
]

{ #category : #accessing }
CircularIterator >> nextBy: aQuantity [
	aQuantity > 0
		ifTrue: [ aQuantity timesRepeat: [ self updateCurrentPositionForward ] ]
		ifFalse: [ aQuantity negated timesRepeat: [ self updateCurrentPositionBackwards ] ].
	^ elements at: currentPosition
]

{ #category : #accessing }
CircularIterator >> turns [
	^ turns
]

{ #category : #updating }
CircularIterator >> updateCurrentPositionBackwards [
	currentPosition  <  2
		ifTrue: [ currentPosition := elements size.
			turns := turns - 1 ]
		ifFalse: [ currentPosition := currentPosition - 1 ]
]

{ #category : #updating }
CircularIterator >> updateCurrentPositionForward [
	currentPosition + 1 > elements size
		ifTrue: [ currentPosition := 1 .
					 turns := turns + 1 ]
		ifFalse: [ currentPosition := currentPosition + 1 ]
]
