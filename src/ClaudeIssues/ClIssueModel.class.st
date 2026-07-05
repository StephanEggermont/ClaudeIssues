Class {
	#name : 'ClIssueModel',
	#superclass : 'Object',
	#instVars : [
		'root',
		'issues',
		'labels'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
ClIssueModel >> initialize [
	issues := OrderedCollection new.
	labels := Dictionary new.
]

{ #category : 'accessing' }
ClIssueModel >> issues [
	^issues
]

{ #category : 'accessing' }
ClIssueModel >> issues: anObject [
	issues := anObject
]

{ #category : 'accessing' }
ClIssueModel >> labels [
	^ labels
]

{ #category : 'accessing' }
ClIssueModel >> labels: anObject [
	labels := anObject
]

{ #category : 'accessing' }
ClIssueModel >> read [
	| issuesJson |
	issuesJson := STONJSON fromString: root contents.
	issuesJson do: [:rawIssue | |issue closed|
		closed := (rawIssue at: #closedAt).
		closed ifNotNil: [closed := closed asZTimestamp].
		issue := ClIssue new
			createdAt: (rawIssue at: #createdAt) asZTimestamp;
			closedAt:  closed;
			number: (rawIssue at: #number);
			title: (rawIssue at: #title);
			comments: (rawIssue at: #comments);
			body: (rawIssue at: #body ifAbsentPut:['']);
			data: rawIssue;
			yourself.
		(rawIssue at: #labels) do: [:label |
			 labels at: (label at: #name) ifAbsentPut: [label].
			 issue addLabel: (labels at: (label at: #name))].
		self issues add: issue].
	
]

{ #category : 'accessing' }
ClIssueModel >> root [
	^ root
]

{ #category : 'accessing' }
ClIssueModel >> root: aFileReference [
	root := aFileReference
]
