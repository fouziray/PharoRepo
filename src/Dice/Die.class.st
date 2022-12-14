Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: aNumber [
"Create and initialize a new die with aNumber faces."
| instance |
instance := self new.
instance faces: aNumber.
^ instance
]

{ #category : #accessing }
Die >> faces [
	^faces 
]

{ #category : #accessing }
Die >> faces: number [
	"faces instance variable setter"
	faces:= number.
]

{ #category : #initialization }
Die >> initialize [ 
	super initialize.
	faces:= 6.
	
	
]

{ #category : #printing }
Die >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' (', faces printString, ')'
]

{ #category : #'as yet unclassified' }
Die >> roll [
	^ (1 to: faces ) atRandom.
]
