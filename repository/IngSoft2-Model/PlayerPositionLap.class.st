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
	lap := lap max: 0
]

{ #category : #updating }
PlayerPositionLap >> updateThePositionTo: aValue [
	position := aValue
]

{ #category : #updating }
PlayerPositionLap >> updateToInitialPosition [
	position := 1
]
