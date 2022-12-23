function Get-FileSize {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[SupportsWildcards]
		[ValidateNotNullOrEmpty()]
		[Alias("F")]
		[string]$File,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Defaults",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		#The 'Length' Property in Kilobytes (KB).
		[Alias("L","Length")]
		[int]$FileSize,
		
		[Parameter(Mandatory=$False,
		           ParameterSetName="OutputSizes")]
		[Parameter(Mandatory=$False,
		           ParameterSetName="Defaults")]
		[Alias("MB")]
		[switch]$Megabytes,
		
		[Parameter(Mandatory=$False,
		           ParameterSetName="OutputSizes")]
		[Alias("GB")]
		[switch]$Gigabytes,
		
		[Parameter(Mandatory=$False,
		           ParameterSetName="OutputSizes")]
		[Alias("TB")]
		[switch]$Terabytes
		
		[Parameter(Mandatory=$False,
		           ParameterSetName="OutputSizes")]
		[Alias("B")]
		[switch]$Bytes
	)
	
	
	
	begin {
		if ( "*" -in $PsCmdlet.ParameterSetName.$OutputSizes -eq $Null -or $False ) {
			$Megabytes = $True
		}
		
		switch ( $OutputSizes ) {
			'Megabytes' {
				$DivideBy	= 1024
				$StrAppend	= "MB"
			}
			
			'Gigabytes' {
				$DivideBy	= (1024 * 1024)
				$StrAppend	= "GB"
			}
			
			'Terabytes' {
				$DivideBy	= ((1024 * 1024) * 1024)
				$StrAppend	= "TB"
			}
			
			'Bytes' {
				$MultiplyBy	= 1024
				$StrAppend	= "B (Bytes)"
			}
		}
	}
	

	process {
		if ( $File -ne $Null ) {
			$SizeCalc = $(
				[Math]::Round(
					$File.Property.Length / ${DivideBy}
					),2
				)
		}
		
		$SizeStr = $(
			[string]::Format('0:N', $SizeCalc)
			)
		$Size = "${SizeStr} ${StrAppend}"
	}
	
	
	end {
		#
	}
}