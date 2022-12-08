function New-AdvFunction {
	[CmdletBinding]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[Alias("V","Name","N")]
		[string[]]$Verb,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Sorting",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False)]
		[Alias("S")]
		[string]$SortBy,
		
		[Alias("Flip","RO")]
		[switch]$ReverseOrder,
		
		
		[string[]]$Property
	)
	
	#★ Begin Process Block
	begin {
		
		$SortOptions = @(
			"Verb",
			"Group",
			"AliasPrefix",
			"Alias",
			"Description"
		)
		
		if ( "$SortBy" -ne $null ) {
			if ( "${SortOptions}" -not -contains "$SortBy" ) {
				throw "Unrecognized 'SortBy' input."
				Write-Host "`n`t`e[1;38;5;153m Test `n`e[0m"
			}
		} elseif ( "$SortBy" -eq $null ) {
			$SortBy = "Verb"
		}
		
	}
	
	#★ Main Process Block
	process {
		Get-Verb -Verb "${Verb}" | 
		Sort-Object -Property "${SortBy}" | 
		Format-Table -Wrap -AutoSize -Property Verb, AliasPrefix, Description
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


