"
Collection for triangles
"
Class {
	#name : #TrianglesCollection,
	#superclass : #Object,
	#instVars : [
		'memory'
	],
	#category : #'Team-7'
}

{ #category : #adding }
TrianglesCollection >> addAll: aShapeCollection [

	^ memory addAll: (aShapeCollection select: [ :x | x isKindOf: Triangle ])
]

{ #category : #adding }
TrianglesCollection >> addFirst: aShape [

	self checkAnObject: aShape.
	^ memory addFirst: aShape
]

{ #category : #adding }
TrianglesCollection >> addFromDialog [

	| shape |
	(shape := Triangle getInstanceByRequest ) ifNotNil: [
		memory add: shape ]
]

{ #category : #accessing }
TrianglesCollection >> at: anIndex [

	^ memory at: anIndex

]

{ #category : #accessing }
TrianglesCollection >> at: anIndex put: aShape [

	self checkAnObject: aShape.
	^ memory at: anIndex put: aShape
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> checkAnObject: anObject [

	(anObject isKindOf: Triangle ) ifFalse: [
		^ self error: 'TrianglesContainer contains only Triangle instances' ]
]

{ #category : #enumerating }
TrianglesCollection >> do: aBlock [

	memory do: aBlock
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> greatestArea [

	^ memory inject: (memory at: 1) into: [ :s  :x | s area max: x area]
]

{ #category : #initialization }
TrianglesCollection >> initialize [ 

	memory:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> loadFromCodeFile: pathString [
pathString asFileReference readStreamDo: [ :in |
	^ Smalltalk compiler evaluate: in contents ]
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> loadFromStonFile: pathString [
pathString asFileReference readStreamDo: [ :in |
	^ Smalltalk compiler evaluate: in contents ]
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> loadFromStoneFile: pathString [
pathString asFileReference readStreamDo: [ :in |
	^ (STON reader on: in) next ]
]

{ #category : #'class factory' }
TrianglesCollection >> ofType: aType [

	^ self class new addAll: (memory select: [ :x | x isMemberOf: aType ]); yourself 
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> pickFileAndLoad: pattern [

	|pathString|
	pathString:= UIManager default
					chooseFullFileNameMatching: { pattern } 
					label:   'Choose File to open'.
	pathString ifNil: [ ^ nil ].
	'*.ston' = pattern ifTrue: [ ^ self loadFromStonFile: pathString ].
	'*.stc' = pattern ifTrue: [ ^ self loadFromCodeFile: pathString ].
	
	^ self error: 'Unknown type of file: ', pattern
				 
]

{ #category : #printing }
TrianglesCollection >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $:;
		nextPut: Character cr.
	memory do: [ :aShape |
		aStream nextPutAll: ' - '.
		aShape printOn: aStream.
		aStream nextPut: Character cr ]
]

{ #category : #printing }
TrianglesCollection >> printToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self printString ]
]

{ #category : #files }
TrianglesCollection >> saveToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: (STON toString: self) ]
]

{ #category : #accessing }
TrianglesCollection >> size [

	^ memory size
]

{ #category : #'as yet unclassified' }
TrianglesCollection >> storeToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self storeString ]
]
