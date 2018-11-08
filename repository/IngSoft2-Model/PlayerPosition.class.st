"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Message

- message one  
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	lap:		<Object>
	player:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #PlayerPosition,
	#superclass : #Object,
	#instVars : [
		'player',
		'position',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerPosition class >> player: aPlayer position: aPositionValue laps: aLapsValue [
	^self new initializeWithPlayer: aPlayer position: aPositionValue laps: aLapsValue
]

{ #category : #initialization }
PlayerPosition >> initializeWithPlayer: aPlayer position: aPositionValue laps: aLapsValue [
	player := aPlayer.
	position := aPositionValue.
	lap := aLapsValue
]

{ #category : #accessing }
PlayerPosition >> lap [
	^ lap
]

{ #category : #accessing }
PlayerPosition >> player [
	^ player
]

{ #category : #accessing }
PlayerPosition >> position [
	^ position
]
