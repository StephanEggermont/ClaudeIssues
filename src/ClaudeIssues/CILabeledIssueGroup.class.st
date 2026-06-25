Class {
	#name : 'CILabeledIssueGroup',
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
CILabeledIssueGroup >> initialize [
	issueGroups := OrderedDictionary new
]

{ #category : 'accessing' }
CILabeledIssueGroup >> issueGroups [
	^ issueGroups
]

{ #category : 'accessing' }
CILabeledIssueGroup >> issueGroups: anObject [
	issueGroups := anObject
]

{ #category : 'accessing' }
CILabeledIssueGroup >> label [
	^ label
]

{ #category : 'accessing' }
CILabeledIssueGroup >> label: anObject [
	label := anObject
]
