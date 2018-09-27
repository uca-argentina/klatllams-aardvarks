Class {
	#name : #RandomDiceState,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomDiceState >> initialize [
	name := 'random'
]

{ #category : #accessing }
RandomDiceState >> name [
	^ name
]

{ #category : #action }
RandomDiceState >> roll: aDice [
	^ aDice randomStateRoll
]
