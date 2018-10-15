Class {
	#name : #WormHoleSpace,
	#superclass : #Space,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
WormHoleSpace >> affect: aPlayer [
	board move: aPlayer by: -4.
]
