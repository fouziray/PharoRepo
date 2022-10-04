Class {
	#name : #Noeud,
	#superclass : #Object,
	#instVars : [
		'valeur',
		'suivant'
	],
	#category : #ListeChainee
}

{ #category : #initialization }
Noeud >> initialize [ 
	super initialize 
]

{ #category : #accessing }
Noeud >> suivant [
    ^suivant
]

{ #category : #'as yet unclassified' }
Noeud >> suivant: suivantref [
    suivant := suivantref
]

{ #category : #accessing }
Noeud >> valeur [
	^valeur
]

{ #category : #accessing }
Noeud >> valeur: nouvelleValeur [
    valeur := nouvelleValeur 
]
