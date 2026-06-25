Class {
	#name : 'CIPresentation',
	#superclass : 'Object',
	#instVars : [
		'model',
		'times'
	],
	#category : 'ClaudeIssues-Model',
	#package : 'ClaudeIssues',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
CIPresentation >> addIssue: issue [ 
	|month group resolution resolutionGroup|
	month := issue creationYearMonth.
	group := times at: month ifAbsentPut: [CILabeledIssueGroup new label: month].
	resolution := issue resolutionTimeWeeks.
	resolutionGroup := group issueGroups at: resolution ifAbsentPut: (CILabeledIssueGroupLeaf new label: resolution).
	resolutionGroup issueGroups add: issue
]

{ #category : 'as yet unclassified' }
CIPresentation >> fill [
	self model issues do: [:issue |
		self addIssue: issue].
	times do: [:lig | |sorted|
		sorted := lig issueGroups associations sorted: [:a :b | a key < b key].
		lig issueGroups: OrderedDictionary new.
		sorted do: [:gr |
			lig issueGroups  at: gr key put: gr value]]
]

{ #category : 'as yet unclassified' }
CIPresentation >> initialize [
	times := OrderedDictionary new
]

{ #category : 'accessing' }
CIPresentation >> model [
	^ model
]

{ #category : 'accessing' }
CIPresentation >> model: anObject [
	model := anObject
]

{ #category : 'accessing' }
CIPresentation >> times [
	^ times
]

{ #category : 'accessing' }
CIPresentation >> times: anObject [
	times := anObject
]
