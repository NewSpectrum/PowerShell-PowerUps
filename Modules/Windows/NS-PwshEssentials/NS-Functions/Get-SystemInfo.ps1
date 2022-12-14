

function Get-SystemInfo {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Directories",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("J","JSON")]
		[string]$JSONPath
	)
	
	begin {
		$HostInfo = [PSCustomObject]@{
			PowerShell	= $Null
			Windows		= $Null
			System		= $Null
		}
	}
	
	
	process {
		$HostInfo.PowerShell = Get-Host | %{
			[PSCustomObject]@{
				Version		= $_.Version
			}
		}
		
		$HostInfo.Windows = Get-ComputerInfo | %{
			[PSCustomObject]@{
				OSName			= $_.WindowsProductName
				OSFullName		= $_.OsName
				Version			= $_.OsVersion
				Edition			= $_.WindowsEditionId
				SystemClass		= $_.OsProductType
				Architecture	= $_.OsArchitecture
				ServerLevel		= $_.OsServerLevel
				ComputerName	= $_.CsCaption
				
			}
		}
		
		$HostInfo.System = Get-ComputerInfo | %{
			[PSCustomObject]@{
				MBManufacturer		= $_.CsManufacturer
				BiosManufacurer		= $_.BiosManufacurer
				BiosCaption			= $_.BiosCaption
				SystemType			= $_.CsSystemType
			}
		}
		
		
	}
	
	
	end {
		#
	}
	
}