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
		'lastCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RedoCard class >> ownedBy: aPlayer [
	^ self new initializeOwnedBy: aPlayer.
]

{ #category : #affecting }
RedoCard >> affect: aPlayer on: aBoard [
	lastCard affect: aPlayer on: aBoard
]

{ #category : #asserting }
RedoCard >> assertCardAffectsAllThePlayers [
	^ lastCard assertCardAffectsAllThePlayers
]

{ #category : #asserting }
RedoCard >> assertCardNeedsLastCard [
	^true
]

{ #category : #asserting }
RedoCard >> assertIsATransientCard [
	^ true
]

{ #category : #updating }
RedoCard >> lastCardPlayed: aCard [
	lastCard := aCard 
]
