Class {
	#name : #Util,
	#superclass : #Object,
	#category : #MetaClassDoc
}

{ #category : #'as yet unclassified' }
Util >> getMetaData: classe [
	| resultat nbVarInstance varInstance|
	
	nbVarInstance:=classe instVarNames size asString.
	 
	varInstance :=' and ' join: classe instVarNames.
	resultat := String streamContents: [ :stream |
		stream 
			nextPutAll: 'le nom de la classe:  ';
			nextPutAll: '';
			nextPutAll: classe className   ;
			nextPut: Character cr;
			
			nextPutAll: 'Hérite de: ';
			nextPutAll: classe superclass className ;
			nextPut: Character cr;
			
			nextPutAll: 'it has ';
			nextPutAll: nbVarInstance  ; 
			nextPutAll: ' Variables : ';
			nextPutAll: varInstance   ;
			nextPut: Character cr; 
			
			nextPutAll: 'It is defined in package: ';
			nextPutAll:  classe package name ; 
			nextPut: Character cr; 
			
			nextPutAll: 'It has the following methods : ';
			nextPutAll: (', ' join: classe selectors );
			nextPut: Character cr
			].
	^ resultat.
]
