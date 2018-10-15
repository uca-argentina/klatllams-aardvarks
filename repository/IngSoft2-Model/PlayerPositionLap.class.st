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
	#name : #PlayerPositionLap,
	#superclass : #Object,
	#instVars : [
		'player',
		'position',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerPositionLap class >> player: aPlayer [
	^self new initializeWithPlayer: aPlayer
]

{ #category : #initialization }
PlayerPositionLap >> initializeWithPlayer: aPlayer [
	player := aPlayer.
	position := 1.
	lap := 0
]

{ #category : #accessing }
PlayerPositionLap >> lap [
	^ lap
]

{ #category : #accessing }
PlayerPositionLap >> player [
	^ player
]

{ #category : #accessing }
PlayerPositionLap >> position [
	^ position
]

{ #category : #updating }
PlayerPositionLap >> updateLapBy: aQuantity [
	lap := lap + aQuantity.

]

{ #category : #updating }
PlayerPositionLap >> updateThePositionTo: aValue [
	position := aValue.
]

{ #category : #updating }
PlayerPositionLap >> updateToInitialPosition [
	position := 1
]
