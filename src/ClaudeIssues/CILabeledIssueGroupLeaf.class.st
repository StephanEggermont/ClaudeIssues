Class {
	#name : 'CILabeledIssueGroupLeaf',
	#superclass : 'Object',
	#instVars : [
		'label',
		'issueGroups'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> inactiveClosed [
	^issueGroups count: [:issue | issue inactiveClosed]
]

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> initialize [
	issueGroups := OrderedCollection new
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> issueGroups [
	^ issueGroups
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> issueGroups: anObject [
	issueGroups := anObject
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> label [
	^ label
]

{ #category : 'accessing' }
CILabeledIssueGroupLeaf >> label: anObject [
	label := anObject
]

{ #category : 'as yet unclassified' }
CILabeledIssueGroupLeaf >> timeColorFor: resolvedGroup [
	|nrOfWeeks|
	nrOfWeeks := label.
	nrOfWeeks = -1 ifTrue: [ ^Color blue ].
	nrOfWeeks <= 4 ifTrue: [ ^Color green ].
	nrOfWeeks <= 12 ifTrue: [ ^Color yellow ].
	nrOfWeeks <= 52 ifTrue: [ ^Color orange ].
	^Color red .
]
