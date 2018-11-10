Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'ownedBy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RedoCard class >> ownedBy: aPlayer [
	^self new initializeOwnedBy: aPlayer
]

{ #category : #affecting }
RedoCard >> affect: aPlayer [
]

{ #category : #initialization }
RedoCard >> initializeOwnedBy: aPlayer [ 
	ownedBy := aPlayer.
	
]

{ #category : #accessing }
RedoCard >> ownedBy [
	^ ownedBy
]
