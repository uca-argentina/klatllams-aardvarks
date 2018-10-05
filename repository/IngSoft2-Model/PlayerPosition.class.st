Class {
	#name : #PlayerPosition,
	#superclass : #Object,
	#instVars : [
		'player',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayerPosition class >> player: aPlayer [
	^self new initializeWithPlayer: aPlayer
]

{ #category : #initialization }
PlayerPosition >> initializeWithPlayer:aPlayer [
	player:= aPlayer.
	position:= 0.
]

{ #category : #accessing }
PlayerPosition >> player [
	^ player
]

{ #category : #accessing }
PlayerPosition >> position [
	^ position
]

{ #category : #updating }
PlayerPosition >> updateThePositionBy: aQuantity [
	position := position + aQuantity
]
