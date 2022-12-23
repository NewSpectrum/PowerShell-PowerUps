


function New-SymLink {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$True,
		           Position=0,
				   HelpMessage="The name of the Symbolic (aka 'Soft') Link.",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("Link","L","Name")]
		[string]$LinkName,
		
		[Parameter(Mandatory=$True,
		           Position=0,
				   HelpMessage="The name of the Symbolic (aka 'Soft') Link.",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[ValidateNotNullOrEmpty()]
		[Alias("Target","T","Path")]
		[string]$TargetPath
	)
	
	
	begin {
		if (!( -e "$MySymlinks" )) {
			$MySimlinks = [PSCustomObject]@{
				#
			}
		} else {
			#
		}
	}
	
	
	process {
		#
	}
	
	
	end {
		#
	}
}