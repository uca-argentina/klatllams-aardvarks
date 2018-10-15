Class {
	#name : #MoonWalkSpace,
	#superclass : #Space,
	#instVars : [
		'backwardsValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
MoonWalkSpace >> affect: aPlayer [
   board	moveAllExcept: aPlayer by: backwardsValue.
]
