function New-AdvFunction {
	[CmdletBinding]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   #HelpMessage="Optional Help Info",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[Alias("P")]
		[string]$Parameter
	)
	
	#★ Begin Process Block
	begin {
		#- Typically used to prep for the 'Main Process Block'
			#? Declare variables, arrays, hash tables, PSCustomObjects
			#? Check for (and maybe correct) various conditions with if/else
			#? Establish temporary environment conditions
			#? Setup specific logging & error handling directives
	}
	
	#★ Main Process Block
	process {
		#- The primary focus of the function
	}
	
	#★ End Process Block
	end {
		#- Generally used for 'cleaning up' & error handling
			#? Remove temporary files & folders from the process
			#? Send logs/reports & delete (if user doesn't need them)
			#? Try/Catch/Finally (or additional steps from the main)
	}



<#
.SYNOPSIS
	One-Sentence Summary.

.DESCRIPTION
	Short pararagraph summary.

.PARAMETER Param
	Param Description

.PARAMETER Param
	Param Description

.PARAMETER Param
	Param Description

.NOTES
	Extra Details.

.EXAMPLE 
	Example
	[ details ]
	[ simulated output ]

.EXAMPLE 
	New-CommentHelp -Example
	[ details ]
	[ simulated output ]

.ROLE
	[ name of the 'user role' for the help topic ]
	(optional)

.FUNCTIONALITY
	[ keyword(s) describing the intended function ]
	(optional)

.COMPONENT
	(optional)

.INPUTS
	(optional)

.OUTPUTS
	(optional)

.FORWARDHELPCATEGORY Function
.FORWARDHELPTARGETNAME Command-Name (optional)

.LINK https://
.LINK Related-Function
.LINK Related-Cmdlet
.LINK about_Related_Content
#>
}