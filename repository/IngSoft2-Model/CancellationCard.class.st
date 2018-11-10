Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#instVars : [
		'ownedBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CancellationCard class >> ownedBy: aPlayer [
	^self new initializeOwnedBy: aPlayer
]

{ #category : #affecting }
CancellationCard >> affect: aPlayer [
]

{ #category : #initialization }
CancellationCard >> initializeOwnedBy: aPlayer [ 
	ownedBy := aPlayer.
	
]

{ #category : #acccessing }
CancellationCard >> ownedBy [
	^ ownedBy
]
