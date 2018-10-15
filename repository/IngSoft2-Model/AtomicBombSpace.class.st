Class {
	#name : #AtomicBombSpace,
	#superclass : #Space,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
AtomicBombSpace >> affect: aPlayer [
	board moveAllToInitialPosition.
]
