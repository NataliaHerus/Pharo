"
A representation of ReqularTriangle
"
Class {
	#name : #RegularTriangle,
	#superclass : #Triangle,
	#instVars : [
		'side'
	],
	#category : #'Team-7'
}

{ #category : #'instance creation' }
RegularTriangle class >> newA: a [ 
	^ self basicNew side: a.
]

{ #category : #accessing }
RegularTriangle >> area [
    "Розрахунок площі правильного трикутника"
    ^ (side squared * (3 raisedTo: 0.5)) / 4.
]

{ #category : #'as yet unclassified' }
RegularTriangle >> circumradius [
    "Розрахунок радіуса описаного кола для правильного трикутника"
    ^ (side / (3 raisedTo: 0.5)) / 3.
]

{ #category : #initialization }
RegularTriangle >> initialize [
	super initialize.
    "Ініціалізація для правильного трикутника, всі сторони рівні"
   side := 0.
]

{ #category : #'as yet unclassified' }
RegularTriangle >> inradius [
    "Розрахунок радіуса вписаного кола для правильного трикутника"
    ^ (side / (3 raisedTo: 0.5)) / 6.
]

{ #category : #accessing }
RegularTriangle >> perimeter [
    "Розрахунок периметра правильного трикутника"
    ^ 3 * side.
]

{ #category : #printing }
RegularTriangle >> print [
    "Метод для виведення трикутника на екран"
    super print.
]

{ #category : #printing }
RegularTriangle >> printOn: aStream [
    "Метод для виведення трикутника в потік"
    aStream nextPutAll: 'A Triangle ['.
	side printOn: aStream.
	aStream nextPut: $x.
	side printOn: aStream.
	aStream nextPut: $x.
	side printOn: aStream.
	aStream nextPut: $].
]

{ #category : #accessing }
RegularTriangle >> side: aNumber [
    "Встановити сторону для правильного трикутника"
    side := aNumber.
]
