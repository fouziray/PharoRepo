Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #arithmetic }
DieHandle >> + aDieHandler [
	|result|
	result:=DieHandle new.
	result addAll: aDieHandler dice.
	result addAll: self dice.
	^result .
]

{ #category : #adding }
DieHandle >> addDie: aDie [
	dice add: aDie.
]

{ #category : #accessing }
DieHandle >> dice [
	^dice .
]

{ #category : #'as yet unclassified' }
DieHandle >> diceNumber [
	^ dice size
]

{ #category : #initialization }
DieHandle >> initialize [ 
	super initialize.
	dice := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
DieHandle >> roll [
	| sum |
	sum:=0.
	dice do: [ :each  | sum:= sum+ each roll ].
	^sum.
]
