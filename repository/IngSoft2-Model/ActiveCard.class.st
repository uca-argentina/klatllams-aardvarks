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
	affectedPlayer:		<Object>
	card:		<Object>


    Implementation Points
"
Class {
	#name : #ActiveCard,
	#superclass : #Object,
	#instVars : [
		'card',
		'affectedPlayers'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ActiveCard class >> withCard: aCard affecting: aPlayerCollection [
	^ self new initializeWithCard: aCard affecting: aPlayerCollection asOrderedCollection
]

{ #category : #accessing }
ActiveCard >> affects: aPlayer [
	affectedPlayers detect: [ :player | aPlayer = player ] ifFound: [ ^ true ].
	^ false
]

{ #category : #accessing }
ActiveCard >> card [
	^ card
]

{ #category : #initialization }
ActiveCard >> initializeWithCard: aCard affecting: aPlayersCollection [
	card := aCard.
	affectedPlayers := aPlayersCollection.
]
