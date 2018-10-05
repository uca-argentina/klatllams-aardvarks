Class {
	#name : #RandomType,
	#superclass : #Object,
	#instVars : [
		'maxValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RandomType class >> rollingUntil: aValue [
	^ self new initializeRollingUntil: aValue
]

{ #category : #initialization }
RandomType >> initializeRollingUntil: aValue [
	maxValue:= aValue 
]

{ #category : #action }
RandomType >> roll [
	^ (1 to: maxValue) atRandom
]
