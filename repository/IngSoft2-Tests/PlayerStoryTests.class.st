Class {
	#name : #PlayerStoryTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerStoryTests >> testAPlayerStoryCanStorageACollectionOfPlayerPosition [
	| playerStory playerPosition |
	playerPosition := PlayerPosition player:'hector' position: 5 laps:1.
	playerStory := PlayerStory player: 'hector'.
	playerStory add: playerPosition.
	playerStory add: playerPosition.
	
]
