Class {
	#name : #RandomType,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomType >> initialize [
	name := 'random'
]

{ #category : #accessing }
RandomType >> name [
	^ name
]

{ #category : #action }
RandomType >> roll: aDice [
	^ aDice randomRoll
]
