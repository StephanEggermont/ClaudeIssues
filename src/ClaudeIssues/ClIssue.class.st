Class {
	#name : 'ClIssue',
	#superclass : 'Object',
	#instVars : [
		'data',
		'createdAt',
		'number',
		'title',
		'closedAt',
		'labels',
		'comments',
		'inactiveClosed'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
ClIssue >> addLabel: aLabel [
	labels add: aLabel
]

{ #category : 'as yet unclassified' }
ClIssue >> calculateInactiveClosed [
	| last|
	inactiveClosed := false.
	closedAt ifNil: [^false].
	comments ifNil: [^false].
	comments ifEmpty: [^false].
	(comments size = 1) ifTrue: [ |txt|
		txt := (comments first at: #body).
		(txt beginsWith: 'Closing for now') ifTrue: [
			^inactiveClosed := true].
		(txt beginsWith: 'This issue has been automatically closed') ifTrue: [
				^inactiveClosed := true].
				^false].
	last := comments last at: #body.
	(last beginsWith: 'Closing for now') ifTrue: [
		^inactiveClosed := true].
	(last beginsWith: 'This issue has been automatically closed') ifTrue: [
		^inactiveClosed := true].
	(last beginsWith:'This issue has been automatically locked') ifTrue: [ |txt|
		txt := (comments at: (comments size -1)) at: #body.
		(txt beginsWith: 'Closing for now') ifTrue: [
			^inactiveClosed := true].
		(txt beginsWith: 'This issue has been automatically closed') ifTrue: [
				^inactiveClosed := true]].
	^inactiveClosed

]

{ #category : 'accessing' }
ClIssue >> closedAt [
	^ closedAt
]

{ #category : 'accessing' }
ClIssue >> closedAt: closed [ 
	closedAt := closed
]

{ #category : 'accessing' }
ClIssue >> comments [
	^ comments
]

{ #category : 'accessing' }
ClIssue >> comments: anObject [
	comments := anObject
]

{ #category : 'accessing' }
ClIssue >> createdAt [
	^ createdAt
]

{ #category : 'accessing' }
ClIssue >> createdAt: aZTimestamp [
	createdAt:= aZTimestamp
]

{ #category : 'as yet unclassified' }
ClIssue >> creationYearMonth [
	^(createdAt year *100) + createdAt month
]

{ #category : 'accessing' }
ClIssue >> data [
	^ data
]

{ #category : 'accessing' }
ClIssue >> data: anObject [
	data := anObject
]

{ #category : 'accessing' }
ClIssue >> inactiveClosed [
	^ inactiveClosed
]

{ #category : 'accessing' }
ClIssue >> inactiveClosed: anObject [
	^ inactiveClosed := anObject
]

{ #category : 'as yet unclassified' }
ClIssue >> initialize [
	labels := OrderedCollection new.
	comments := OrderedCollection new
]

{ #category : 'accessing' }
ClIssue >> labels [
	^ labels
]

{ #category : 'accessing' }
ClIssue >> labels: anObject [
	labels := anObject
]

{ #category : 'accessing' }
ClIssue >> number [
	^ number
]

{ #category : 'accessing' }
ClIssue >> number: aNumber [
	number := aNumber
]

{ #category : 'as yet unclassified' }
ClIssue >> resolutionTimeWeeks [
	"-1 for not resolved
	number of full weeks"
	closedAt ifNil: [^-1].
	^(closedAt - createdAt) days // 7
]

{ #category : 'accessing' }
ClIssue >> title [
	^ title
]

{ #category : 'accessing' }
ClIssue >> title: aString [
	title:= aString
]
