Class {
	#name : #PlayerStoryTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerStoryTests >> testAPlayerStoryCanHaveACollectionOfPlayerPosition [
	| playerStory |
	playerStory := PlayerHistory player: 'hector'.
	playerStory updatePlayerTo: 5 withLaps:1. 
	playerStory updatePlayerTo: 5 withLaps: 1.
	self assert: playerStory player equals: 'hector';
		  assert: playerStory storyElements size equals: 2
	
]
