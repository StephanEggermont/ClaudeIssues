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
	resolutionGroup issueGroups add: issue.
	issue calculateInactiveClosed.
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
CIPresentation >> gtInactiveTimeOn: aView [
	<gtView>
	^ aView mondrian
		title: 'Inactive ResolvedTime';
		priority: 70;
		painting: [ :aMondrian | 
			aMondrian nodes
			stencil: [ :month | 
				GtMondrianUMLClassElement withDefaultContainer 
					label: (month label);
					border: (BlBorder 
						paint: (Color black alpha: 0.5) width: 1)];
		      with: self times;
		      forEach: [ :month |
		      	aMondrian nodes
		      		stencil: [ :resolvedGroup |
		      			BlElement new
		      				height: (resolvedGroup inactiveClosed) sqrt;
		      				width: (resolvedGroup inactiveClosed) sqrt;
		      				margin: (BlInsets all: 1);
		      				background: ((resolvedGroup label = -1) ifTrue: [
		      					Color blue ]
		      				ifFalse: [
		      					Color green])];
		      		with: (month issueGroups) .
		      		aMondrian layout grid].
		aMondrian layout grid.
		aMondrian]
]

{ #category : 'as yet unclassified' }
CIPresentation >> gtResolveTimeOn: aView [
	<gtView>
	^ aView mondrian
		title: 'ResolveTime';
		priority: 50;
		painting: [ :aMondrian | 
			aMondrian nodes
			stencil: [ :month | 
				GtMondrianUMLClassElement withDefaultContainer 
					label: (month label);
					border: (BlBorder 
						paint: (Color black alpha: 0.5) width: 1)];
		      with: self times;
		      forEach: [ :month |
		      	aMondrian nodes
		      		stencil: [ :resolvedGroup |
		      			BlElement new
		      				height: resolvedGroup issueGroups size sqrt;
		      				width: resolvedGroup issueGroups size sqrt;
		      				margin: (BlInsets all: 1);
		      				background: ((resolvedGroup label = -1) ifTrue: [
		      					Color blue ]
		      				ifFalse: [
		      					Color green])];
		      		with: (month issueGroups) .
		      		aMondrian layout grid].
		aMondrian layout grid.
		aMondrian]
]

{ #category : 'as yet unclassified' }
CIPresentation >> gtResolvedActiveTimeOn: aView [
	<gtView>
	^ aView mondrian
		title: 'Active ResolvedTime';
		priority: 60;
		painting: [ :aMondrian | 
			aMondrian nodes
			stencil: [ :month | 
				GtMondrianUMLClassElement withDefaultContainer 
					label: (month label);
					border: (BlBorder 
						paint: (Color black alpha: 0.5) width: 1)];
		      with: self times;
		      forEach: [ :month |
		      	aMondrian nodes
		      		stencil: [ :resolvedGroup |
		      			BlElement new
		      				height: (resolvedGroup issueGroups size - resolvedGroup inactiveClosed) sqrt;
		      				width: (resolvedGroup issueGroups size - resolvedGroup inactiveClosed) sqrt;
		      				margin: (BlInsets all: 1);
		      				background: ((resolvedGroup label = -1) ifTrue: [
		      					Color blue ]
		      				ifFalse: [
		      					Color green])];
		      		with: (month issueGroups) .
		      		aMondrian layout grid].
		aMondrian layout grid.
		aMondrian]
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
