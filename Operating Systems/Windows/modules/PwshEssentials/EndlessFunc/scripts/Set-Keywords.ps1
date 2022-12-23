

function Set-PhotoTags {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$True,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True,
				   HelpMessage="The path to the target image(s). Wildcards are permitted. Must resolve to a single file (unless combined with '-Batch').")]
		[SupportsWildcards]
		[ValidateNotNullOrEmpty()]
		[Alias("P")]
		[string]$Path,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		<#
		The new keyword(s) to be applied to the target files. Separate each new keyword with a ',' comma. Example:
		
			-KW 'Landscape Photography', 'Top-Picks'
		#>
		[Alias("Tags","KW")]
		[string[]]$Keywords
	)
	
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$False,
				   ValueFromPipelineByPropertyName=$False,
				   HelpMessage="Allows you to select multiple items in the '-Path' parameter.")]
		[Alias("B")]
		[switch]$BatchTag,
		
		[Parameter(Mandatory=$True,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True,
				   HelpMessage="The path to the target image(s). Wildcards are permitted. Must resolve to a single file (unless combined with '-Batch').")]
		[SupportsWildcards]
		[ValidateNotNullOrEmpty()]
		[Alias("P")]
		[string]$Path,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		<#
		The new keyword(s) to be applied to the target files. Separate each new keyword with a ',' comma. Example:
		
			-KW 'Landscape Photography', 'Top-Picks'
		#>
		[Alias("Tags","KW")]
		[string[]]$Keywords
	)
	
	
	begin {
		if ( $BatchTag -eq $False ) {
			$Target = [TagLib.File]::Create(
					Resolve-Path "${Path}"
				)
		} elseif ( $BatchTag -eq $True ) {
			$Target = @(
				(Resolve-Path "${Path}")
			)
		}
		
		if ( $Keywords -ne $Null ) {
			$NewTags = @("${Keywords}")
		}
	}
	
	
	process {
		if ( $BatchTag -eq $True ) {
			ForEach ( $File in "$Target" ) {
				$TargetTags = [TagLib]::Create(
					"${Target}"
				)
			}
			ForEach ( $File in $TargetTags ) {
				$File.ImageTag.Keywords = (
					"${NewTags}"
				)
			}
			
		} elseif ( $BatchTag -eq $False -or $Null ) {
			$Target.ImageTag.Keywords = (
				"${NewTags}"
			)
		}
	}
	
	
	end {
		#
	}
}


<#
$photo = [TagLib.File]::Create((Resolve-Path "photo.jpg"))

$photo.ImageTag.Title = "hello"
$photo.ImageTag.Keywords = ("tag", "another tag")
$photo.ImageTag.Comment = "my comment"
$photo.ImageTag.DateTime = [System.DateTime]::Parse("2020-01-02")

$photo.Save()


$Target.ImageTag.("$_.TagName") = "$_.TagValue"
#>