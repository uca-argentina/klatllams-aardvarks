Class {
	#name : #RandomType,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
RandomType >> roll: aDice [
	^ aDice randomRoll
]
