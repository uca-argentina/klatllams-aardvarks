Class {
	#name : #ResultsTable,
	#superclass : #Object,
	#instVars : [
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ResultsTable class >> players: playersCollection [
	playersCollection size < 1
		ifTrue: [ AssertionFailure signal: 'Must have at least 1 player' ].
	^ self new initializeWithPlayers: playersCollection
]

{ #category : #accesing }
ResultsTable >> aPlayerPosition: aPlayer [
	self playersAndPositions
		do: [ :each | 
			(each at: 1) == aPlayer
				ifTrue: [ ^ each at: 2 ] ]
]

{ #category : #'instance initialization' }
ResultsTable >> initializeWithPlayers: playersCollection [
	| tableRow |
	players := LinkedList new.
	playersCollection
		do: [ :each | 
			tableRow := LinkedList new.
			tableRow
				add: each;
				add: 0.
			players add: tableRow ]
]

{ #category : #accesing }
ResultsTable >> playersAndPositions [
	^ players
]

{ #category : #sorting }
ResultsTable >> sortByBoardPosition [
	(1 to: players size)
		do: [ :i | 
			(i to: players size)
				do: [ :j | 
					((players at: j) at: 2) > ((players at: i) at: 2)
						ifTrue: [ players swap: j with: i ] ] ]
]

{ #category : #sorting }
ResultsTable >> sortByPlayerName [
	(1 to: players size)
		do: [ :i | 
			(i to: players size)
				do: [ :j | 
					((players at: j) at: 1) name < ((players at: i) at: 1) name
						ifTrue: [ players swap: j with: i ] ] ]
]

{ #category : #updating }
ResultsTable >> updatePositionPlayer: aPlayerName to: aPosition [
	aPosition < 1
		ifTrue: [ AssertionFailure signal: 'You cannot move a player a negative quantity' ].
	players
		do: [ :each | 
			(each at: 1) name == aPlayerName
				ifTrue: [ each at: 2 put: (each at: 2) + aPosition ] ].
	self sortByBoardPosition
]
