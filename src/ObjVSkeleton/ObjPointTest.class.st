Class {
	#name : #ObjPointTest,
	#superclass : #TestCase,
	#instVars : [
		'pointClass',
		'objectClass',
		'classClass',
		'aPoint',
		'coloredPointClass',
		'aColoredPoint',
		'abstractClass'
	],
	#category : #ObjVSkeleton
}

{ #category : #'as yet unclassified' }
ObjPointTest >> assembleAbstractClass [
	abstractClass := Obj new: 6.
	abstractClass at: abstractClass offsetForName put: #ObjAbstractClass.
	abstractClass at: abstractClass offsetForClass put: #ObjClass.
	abstractClass at: abstractClass offsetForIVs put: #(#class).
	abstractClass at: abstractClass offsetForKeywords put: #().
	abstractClass at: abstractClass offsetForSuperclass put: nil.
	abstractClass at: abstractClass offsetForMethodDict put: (IdentityDictionary new).
	Obj declareClass: abstractClass.

	"here I simulate by hand the way superclass is captured for super lookup, I value the block with nil for now to represent
	the superclass of ObjObject"

	(abstractClass at: abstractClass offsetForMethodDict) at: #print
		put: 
			([:superClassOfClassDefiningTheMethod |
				[:objself | 
			Transcript show: 'I''am an Object';
				cr]] value: nil).

	(abstractClass at: abstractClass offsetForMethodDict) at: #error
		put: 
			([:superClassOfClassDefiningTheMethod |
				[:object :arrayOfArguments | 
			Transcript show: 'Error: selector ' , arrayOfArguments first printString , ' not understood';
				cr.
				Error signal]] value: nil).

	(abstractClass at: abstractClass offsetForMethodDict) at: #getIV
		put: ([:superClassOfClassDefiningTheMethod | [:object :iv | object valueOfInstanceVariable: iv]] value: nil).

	"(abstractClass at: abstractClass offsetForMethodDict) at: #new
		put: 
			([:superClassOfClassDefiningTheMethod | [:object :name :iv :superClass | 
				|abstractInstance |
				abstractInstance := Obj new: 6.
				abstractInstance at: abstractInstance offsetForName put: (object keywordValue: 'name:' getFrom: (name)  ifAbsent:  [object error: 'no name speicifed' ]).
				abstractInstance at: abstractInstance offsetForClass put: #ObjAbstractPoint.
				abstractInstance at: abstractInstance offsetForIVs put: #(#class).
				abstractInstance at: abstractInstance offsetForKeywords put: #().
				abstractInstance at: abstractInstance offsetForSuperclass put:(object keywordValue: 'superclass:' getFrom: (superClass)  ifAbsent:  [object error: 'no superclass speicifed' ])  .
				abstractInstance at: abstractInstance offsetForMethodDict put: (IdentityDictionary new).
				Obj declareClass: abstractInstance.
				(abstractInstance at: abstractInstance offsetForMethodDict) at: #new put: ([:superClassOfClassDefiningTheMethode | [:objectInstance :istanceVariables | objectInstance error: 'intantiation is not allowed ']] value: nil).

				 ]] value: nil)."
			(abstractClass at: abstractClass  offsetForMethodDict) at: #new put: ([:superClassOfClassDefiningTheMethod | [:objectInstance :istanceVariables | objectInstance error: 'instantiation is not allowed ']] value: nil).

]

{ #category : #setup }
ObjPointTest >> assembleClassClass [
	classClass := Obj new: 6.
	classClass at: classClass offsetForName put: #ObjClass.
	classClass at: classClass offsetForClass put: #ObjClass.
	classClass at: classClass offsetForIVs
		put: #(#class #name #superclass #iv #keywords #methodDict).
	classClass at: classClass offsetForKeywords
		put: #(#name: #superclass: #iv: #keywords: #methodDict:).
	classClass at: classClass offsetForSuperclass put: #ObjObject.
	classClass at: classClass offsetForMethodDict
		put: (IdentityDictionary new).
	Obj declareClass: classClass.
	
	(classClass at: classClass offsetForMethodDict) at: #new
		put: 
			([:superClassOfClassDefiningTheMethod | [:object :name :iv :superClass | 
				|abstractInstance |
				abstractInstance := Obj new: 6.
				abstractInstance at: abstractInstance offsetForName put: (object keywordValue: 'name:' getFrom: (name)  ifAbsent:  [object error: 'no name speicifed' ]).
				abstractInstance at: abstractInstance offsetForClass put: (object objName ).
				abstractInstance at: abstractInstance offsetForIVs put: #(#class).
				abstractInstance at: abstractInstance offsetForKeywords put: #().
				abstractInstance at: abstractInstance offsetForSuperclass put:(object keywordValue: 'superclass:' getFrom: (superClass)  ifAbsent:  [object error: 'no superclass speicifed' ])  .
				abstractInstance at: abstractInstance offsetForMethodDict put: (IdentityDictionary new).
				Obj declareClass: abstractInstance.
			
				 ]] value: nil).
]

{ #category : #setup }
ObjPointTest >> assembleColoredInstance [

	
	aColoredPoint :=  coloredPointClass  allocateAnInstance .
	aColoredPoint initializeUsing: #( #x: 24 #y: 6 #color: #blue).
]

{ #category : #setup }
ObjPointTest >> assembleColoredPointClass [
	coloredPointClass := Obj new: 6.
	coloredPointClass at: pointClass offsetForName put: #ObjColoredPoint.
	coloredPointClass at: pointClass offsetForClass put: #ObjClass.
	
	"Here the initialize of metaclass is not available so we perform the instance variable lookup by hand."
	coloredPointClass at: pointClass offsetForIVs put: #( #class #x #y #color).
	coloredPointClass at: pointClass offsetForKeywords  put: #( #x: #y: #color:).
	coloredPointClass at: pointClass offsetForSuperclass put: #ObjPoint.
	coloredPointClass at: pointClass offsetForMethodDict
		put: (IdentityDictionary new).
	Obj declareClass: coloredPointClass.

	(coloredPointClass at: coloredPointClass offsetForMethodDict) at: #print
		put: 
			([ :superClassOfClassDefiningTheMethod | 
				[:objself | 
				Transcript show: 'I''am a colored point';
				cr]] value: pointClass).

	(coloredPointClass at: coloredPointClass offsetForMethodDict) at: #foo
		put: 
			([ :superClassOfClassDefiningTheMethod | 
				[:objself | 
				(objself super: #foo withArguments: #() from: superClassOfClassDefiningTheMethod) + (objself super: #foo withArguments: #() from: superClassOfClassDefiningTheMethod)
				]] value: pointClass).

	(coloredPointClass at: coloredPointClass offsetForMethodDict) at: #bar
		put: 
			([ :superClassOfClassDefiningTheMethod | 
				[:objself | 
				(objself super: #bar withArguments: #() from: superClassOfClassDefiningTheMethod) + (objself super: #bar withArguments:#() from: superClassOfClassDefiningTheMethod)]
			] value: pointClass).
		
	(coloredPointClass at: coloredPointClass offsetForMethodDict) at: #new
		put: 
			([ :superClassOfClassDefiningTheMethod | 
				[:objself :iv| 
				objself initializeUsing: iv.
				 ]
			] value: pointClass).
]

{ #category : #setup }
ObjPointTest >> assembleObjectClass [
	objectClass := Obj new: 6.
	objectClass at: objectClass offsetForName put: #ObjObject.
	objectClass at: objectClass offsetForClass put: #ObjClass.
	objectClass at: objectClass offsetForIVs put: #(#class).
	objectClass at: objectClass offsetForKeywords put: #().
	objectClass at: objectClass offsetForSuperclass put: nil.
	objectClass at: objectClass offsetForMethodDict put: (IdentityDictionary new).
	Obj declareClass: objectClass.

	"here I simulate by hand the way superclass is captured for super lookup, I value the block with nil for now to represent
	the superclass of ObjObject"

	(objectClass at: objectClass offsetForMethodDict) at: #print
		put: 
			([:superClassOfClassDefiningTheMethod |
				[:objself | 
			Transcript show: 'I''am an Object';
				cr]] value: nil).

	(objectClass at: objectClass offsetForMethodDict) at: #error
		put: 
			([:superClassOfClassDefiningTheMethod |
				[:object :arrayOfArguments | 
			Transcript show: 'Error: selector ' , arrayOfArguments first printString , ' not understood';
				cr.
				Error signal]] value: nil).

	(objectClass at: objectClass offsetForMethodDict) at: #getIV
		put: ([:superClassOfClassDefiningTheMethod | [:object :iv | object valueOfInstanceVariable: iv]] value: nil).

	(objectClass at: objectClass offsetForMethodDict) at: #setIV
		put: 
			([:superClassOfClassDefiningTheMethod | [:object :iv :val | 
			object at: (object offsetFromObjectOfInstanceVariable: iv) put: val]] value: nil).

	(objectClass at: objectClass offsetForMethodDict) at: #bar
		put: 
			([:superClassOfClassDefiningTheMethod | [:objself | 
					5]] value: nil).
]

{ #category : #setup }
ObjPointTest >> assemblePointClass [ 
	"creating pointClass"	

	| cl |
	cl := Obj giveClassNamed: #ObjClass.
	pointClass := Obj new: (cl at: cl offsetForIVs) size.
	pointClass at: pointClass offsetForName put: #ObjPoint.
	pointClass at: pointClass offsetForClass put: #ObjClass.
	pointClass at: pointClass offsetForIVs put: #(#class #x #y).
	pointClass at: pointClass offsetForKeywords put: #(#x: #y:).
	pointClass at: pointClass offsetForSuperclass put: #ObjObject.
	pointClass at: pointClass offsetForMethodDict
		put: (IdentityDictionary new).
	Obj declareClass: pointClass.
	Obj giveClassNamed: #ObjPoint.
	(pointClass at: pointClass offsetForMethodDict) at: #x
		put: ([ :superClassOfClassDefiningTheMethod | [:objself | objself valueOfInstanceVariable: #x]] value: objectClass).

	(pointClass at: pointClass offsetForMethodDict) at: #print
		put: 
			([ :superClassOfClassDefiningTheMethod | [:objself | 
			Transcript show: 'I''am a Point';
				cr]] value: objectClass).

	(pointClass at: pointClass offsetForMethodDict) at: #foo
		put: 
			([ :superClassOfClassDefiningTheMethod | 
				[:objself | 
				Transcript show: 'ObjPoint>>foo';cr.
				5
				]] value: objectClass).
	(pointClass at: pointClass offsetForMethodDict ) at: #new
		put:
		([ :superClassOfClassDefiningTheMethod | 
				[:objself :arguments :iv| 
				Transcript show: 'ObjPoint>>new';cr.
				objself initializeUsing: iv.
				
				objself at:1 put: (objself keywordValue: 'name:' getFrom: (arguments)  ifAbsent:  [objself error: 'not found' ] )
				]] value: objectClass ).
		
	(pointClass at: pointClass offsetForMethodDict ) at: #x:
		put:
		([ :superClassOfClassDefiningTheMethod | 
				[:objself :x | "
				objself at: (objself valueOfInstanceVariable: #x) put: x."
				
				objself send: #setIV withArguments: (Array with: 'x' with: x )
				]] value: objectClass ).

	pointClass
   addUnaryMethod: #givex
   withBody: 'objself valueOfInstanceVariable: #x '.
	pointClass
   addUnaryMethod: #display
   withBody: 
    'Transcript cr;
      show: ''aPoint with x = ''.
		
    Transcript show: (objself send: #givex withArguments: #()) printString;
   cr.
	(objself send: #givex withArguments: #()) '.
	
]

{ #category : #setup }
ObjPointTest >> assemblePointInstance [
	aPoint:=  pointClass allocateAnInstance .
	aPoint initializeUsing: #(#name: #ObjPoint #x: 24 #y: 6).
	
]

{ #category : #running }
ObjPointTest >> setUp [
	Obj initialize.
	self assembleClassClass.
	self assemblePointClass.
	self assembleObjectClass.
	self assembleColoredPointClass.
	self assembleAbstractClass.
	self assemblePointInstance.
	self assembleColoredInstance 

	
]

{ #category : #tests }
ObjPointTest >> testAbstractClassInstantiation [
	abstractClass  
  	send: #new
 	 withArguments: #(#(#name: #ObjAbstractPoint )
           	#() 
            #(#superclass: #ObjPoint)).

	self should: [ Obj ObjAbstractPoint send: #new
   withArguments: #(#(#x: 24 #y: 6)). ] raise: Error .
]

{ #category : #tests }
ObjPointTest >> testColoredPointMethods [

	aColoredPoint send: #new withArguments: #((#x: 24 #y: 6 #color: #blue)).
	self assert: (aColoredPoint send: #getIV withArguments: #(#x) )= 24.
	aColoredPoint send: #setIV withArguments: #(#x 25).
	self assert: (aColoredPoint send: #getIV withArguments: #(#x))= 25.
	self assert: (aColoredPoint send: #getIV withArguments: #(#color))= #blue.
	
	 abstractClass  
  	send: #new
 	 withArguments: #(#(#name: #ObjAbstractPoint )
           	#() 
            #(#superclass: #ObjPoint)).

	self should: [ Obj ObjAbstractPoint send: #new
   withArguments: #(#(#x: 24 #y: 6)). ] raise: Error .
]

{ #category : #setup }
ObjPointTest >> testPointMethod [

	aPoint  send: #new withArguments: #( #(#name: #ObjPoint)  #(#x: 24 #y: 9)).

	self assert: ((aPoint send: #getIV withArguments: #(#x)) = 24 ).
	
	aPoint send: #setIV withArguments: #(#x 25).
	self assert: ((aPoint send: #getIV withArguments: #(#x) )=25).
	self assert: ((aPoint at: 1) = #ObjPoint). 
	aPoint send: #x: withArguments:  #(26).
	self assert: ((aPoint send: #getIV withArguments: #(#x) )=26).
	aPoint send: #x: withArguments: #(27).
	self assert: (aPoint send: #display withArguments: #())=27.
	self assert: (aPoint send: #x withArguments: #())=27.	
]
