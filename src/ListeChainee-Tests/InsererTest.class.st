Class {
	#name : #InsererTest,
	#superclass : #TestCase,
	#instVars : [
		'listee',
		'liste'
	],
	#category : #'ListeChainee-Tests'
}

{ #category : #initialization }
InsererTest >> setUp [
super setUp. 
   listee := Liste new.
]

{ #category : #tests }
InsererTest >> testInsertion [
    | noeud | 
    noeud := Noeud new.
    noeud valeur:  5.
 
    listee inserer: noeud.
    self assert: (listee premier) valeur equals: 5. 
]

{ #category : #tests }
InsererTest >> testSuppression [
    | noeud | 
	liste:= Liste new.
	
    noeud := Noeud new.
    noeud valeur:  5.
 	 listee inserer: noeud.
	 noeud := Noeud new.
    noeud valeur:  4.
	 listee inserer: noeud.
    self assert: (listee deleteNode: 5) valeur equals: 5. 
]
