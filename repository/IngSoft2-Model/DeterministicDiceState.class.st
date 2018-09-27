Class {
	#name : #DeterministicDiceState,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
DeterministicDiceState >> initialize [
	name := 'deterministic'
]

{ #category : #accessing }
DeterministicDiceState >> name [
	^ name
]

{ #category : #action }
DeterministicDiceState >> roll: aDice [
	^ aDice deterministicStateRoll
]
