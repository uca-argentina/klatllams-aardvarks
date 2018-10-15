Class {
	#name : #SpeedUpSpace,
	#superclass : #Space,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
SpeedUpSpace >> affect: aPlayer [
	board move: aPlayer by: 4.
]
