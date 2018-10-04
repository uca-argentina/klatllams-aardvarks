Class {
	#name : #PlayersPosition,
	#superclass : #Object,
	#instVars : [
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PlayersPosition class >> players: playersCollection [
	^ self new initializeWithPlayers: playersCollection
]

{ #category : #'instance initialization' }
PlayersPosition >> initializeWithPlayers: playersCollection [
	| tableRow |
	players := OrderedCollection new.
	playersCollection elements
		do: [ :each | 
			tableRow := OrderedCollection new.
			tableRow
				add: each;
				add: 0.
			players add: tableRow ]
]

{ #category : #accesing }
PlayersPosition >> playersAndPositions [
	^ players
]

{ #category : #accesing }
PlayersPosition >> positionOf: aPlayer [
	self playersAndPositions
		do: [ :each | 
			(each at: 1) == aPlayer
				ifTrue: [ ^ each at: 2 ] ]
]

{ #category : #sorting }
PlayersPosition >> sortByBoardPosition [
	(1 to: players size)
		do: [ :i | 
			(i to: players size)
				do: [ :j | 
					((players at: j) at: 2) > ((players at: i) at: 2)
						ifTrue: [ players swap: j with: i ] ] ]
]

{ #category : #accesing }
PlayersPosition >> topPlayer [
	^(players at: 1) at: 1
]

{ #category : #updating }
PlayersPosition >> updatePositionOf: aPlayer to: aPosition [
	aPosition < 1
		ifTrue: [ AssertionFailure signal: 'You cannot move a player a negative quantity' ].
	players
		do: [ :each | 
			(each at: 1)  == aPlayer
				ifTrue: [ each at: 2 put: (each at: 2) + aPosition ] ].
	self sortByBoardPosition.
	Transcript show:( self playersAndPositions).
]
