Class {
	#name : #PlayerStoryTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerStoryTests >> testAPlayerStoryCanStorageACollectionOfPlayerPosition [
	| playerStory |
	playerStory := PlayerStory player: 'hector'.
	playerStory add: 5 withLaps:1. 
	playerStory add: 5 withLaps: 1.
	
]
