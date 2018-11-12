Class {
	#name : #LandingPosition,
	#superclass : #Object,
	#instVars : [
		'landingPlayer',
		'landingPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LandingPosition class >> player: aPlayer position: aPosition [
	^ self new initializeWithPlayer: aPlayer position: aPosition
]

{ #category : #initialization }
LandingPosition >> initializeWithPlayer: aPlayer position: aPosition [
	landingPlayer := aPlayer.
	landingPosition := aPosition
]

{ #category : #accessing }
LandingPosition >> landingPlayer [
	^ landingPlayer
]

{ #category : #accessing }
LandingPosition >> landingPosition [
	^ landingPosition
]
