


function New-SymLink {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   HelpMessage="The name of the Symbolic (aka 'Soft') Link.",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("Link","L","Name")]
		[string]$LinkName,
		
		[Parameter(Mandatory=$False,
		           Position=0,
				   HelpMessage="The name of the Symbolic (aka 'Soft') Link.",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("Path","P","Location")]
		[string]$LinkPath,
		
		[Parameter(Mandatory=$True,
		           Position=0,
				   HelpMessage="The name of the Symbolic (aka 'Soft') Link.",
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[ValidateNotNullOrEmpty()]
		[Alias("Target","T","Value")]
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
		New-Item -ItemType 'SymbolicLink' -Name "${LinkName}" -Path "${LinkPath}" -Value "${TargetPath}"
	}
	
	
	end {
		#
	}
}