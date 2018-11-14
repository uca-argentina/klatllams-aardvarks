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
	notUsedCard:		<Object>
	owner:		<Object>


    Implementation Points
"
Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#instVars : [
		'notUsedCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RepeatCard class >> ownedBy: aPlayer [
	^ self new initializeOwnedBy: aPlayer.
]

{ #category : #affecting }
RepeatCard >> affect: aPlayer on: aBoard [
	| aPosition |
	aPosition := aBoard lastLandingPositionOf: aPlayer.
	(self assertCanMoveTo: aPosition)
		ifTrue: [ (aBoard spaces at: aPosition) affect: aPlayer on: aBoard ].
	notUsedCard := false
]

{ #category : #affecting }
RepeatCard >> assertCanMoveTo: aPosition [
	^ aPosition ~= 0 & notUsedCard
]

{ #category : #asserting }
RepeatCard >> assertIsCardATransientCard [
	^ true
]

{ #category : #initialization }
RepeatCard >> initializeOwnedBy: aPlayer [
	owner := aPlayer.
	notUsedCard := true
]
