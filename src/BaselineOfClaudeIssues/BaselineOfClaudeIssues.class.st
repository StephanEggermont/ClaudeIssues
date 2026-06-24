Class {
	#name : 'BaselineOfClaudeIssues',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfClaudeIssues',
	#package : 'BaselineOfClaudeIssues'
}

{ #category : 'loading' }
BaselineOfClaudeIssues class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'ClaudeIssues' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : 'baseline' }
BaselineOfClaudeIssues >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'ClaudeIssues'
		]
]
