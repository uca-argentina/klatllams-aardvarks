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
	player:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #LandingPosition,
	#superclass : #Object,
	#instVars : [
		'player',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LandingPosition class >> player: aPlayer on: aPosition [
	^ self new initializeWithPlayer: aPlayer on: aPosition
]

{ #category : #initialization }
LandingPosition >> initializeWithPlayer: aPlayer on: aPosition [
	player := aPlayer.
	position := aPosition
]

{ #category : #accessing }
LandingPosition >> player [
	^ player
]

{ #category : #accessing }
LandingPosition >> position [
	^ position
]
