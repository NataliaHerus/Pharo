"
Triangle factory
"
Class {
	#name : 'TriangleFactory',
	#superclass : 'Object',
	#instVars : [
		'memorytriangleList',
		'triangleList',
		'FileStream',
		'CompilerTranscript'
	],
	#category : 'Team-7',
	#package : 'Team-7'
}

{ #category : 'adding' }
TriangleFactory >> addTriangle: aTriangle [ [
        triangleList add: aTriangle.
    ]
]

{ #category : 'as yet unclassified' }
TriangleFactory >> createRegularTriangleWithSide: side [
        | newRegularTriangle |
        newRegularTriangle := RegularTriangle new.
        newRegularTriangle initialize: side.
        ^ newRegularTriangle.
]

{ #category : 'as yet unclassified' }
TriangleFactory >> createTriangleBatchOfSize: size [ [
    | triangles |
    triangles := OrderedCollection new.
    size timesRepeat: [
        triangles add: (self createTriangleWithSides: ((1 to: 3) collect: [:i | i atRandom])).
    ].
    ^ triangles.
]
]

{ #category : 'as yet unclassified' }
TriangleFactory >> createTriangleWithSides: sides [ [
    | newTriangle |
    newTriangle := Triangle new.
    newTriangle initialize: (sides at: 1) and: (sides at: 2) and: (sides at: 3).
    ^ newTriangle.
]
]

{ #category : 'as yet unclassified' }
TriangleFactory >> displayFactoryInfo [

	[
	Transcript
		show:
			'Factory Information:' , String newLine , 'Triangles in Stock: '
			, triangleList size printString;
		cr ]
]

{ #category : 'initialization' }
TriangleFactory >> initialize [

	
	triangleList := OrderedCollection new
]

{ #category : 'as yet unclassified' }
TriangleFactory >> loadFromFile: fileName [ [
        | file loadedList |
        file := FileStream fileNamed: fileName.
        loadedList := (file nextLine) asArray readStream next.
        triangleList := loadedList collect: [:each | (Compiler evaluate: each)].
        file close.
    ]
]

{ #category : 'printing' }
TriangleFactory >> printAllTriangleInfo [ [
        "Method for printing information about all triangles in the container"
        triangleList do: [:eachTriangle | self printTriangleInfo: eachTriangle].
    ]
]

{ #category : 'printing' }
TriangleFactory >> printRegularTriangleInfo [

	[ "Method for printing information about all regular triangles in the container"
	triangleList
		select: [ :eachTriangle | eachTriangle isKindOf: RegularTriangle ]
		do: [ :regularTriangle | self printTriangleInfo: regularTriangle ] ]
]

{ #category : 'printing' }
TriangleFactory >> printTriangleInfo: aTriangle [

	[ "Method for printing information about a triangle"
	aTriangle printTriangle .
	Transcript
		show: 'Area: ' , aTriangle area printString , ' Perimeter: '
			, aTriangle perimeter printString;
		cr ]
]

{ #category : 'files' }
TriangleFactory >> saveToFile: fileName [ [
        | file |
        file := FileStream newFileNamed: fileName.
        file nextPutAll: (triangleList asArray storeString).
        file close.
    ]
]
