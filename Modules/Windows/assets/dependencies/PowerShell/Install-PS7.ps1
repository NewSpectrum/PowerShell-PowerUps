# Set Preference Variables
$WarningPreference		= "SilentlyContinue"
$ConfirmPreference		= "None"
$ErrorActionPreference	= "Suspend"
$ErrorView				= "CategoryView"

# Set Script Parameters
[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Directories",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("WD","Path")]
		[string]$WorkingDirectory,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Directories",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("LP","Logs")]
		[string]$LogPath
	)



# Set Working Directories
	$CWD = [PSCustomObject]@{
		Defaults = [PSCustomObject]@{
			Main	= "$env:UserProfile\.pwsh7"
			Logs	= "$env:UserProfile\.pwsh7\logs"
			Package	= "$env:UserProfile\.pwsh7\package"
		}
		Fallbacks = [PSCustomObject]@{
			Main	= ".\.pwsh7"
			Logs	= ".\.pwsh7\logs"
			Package	= ".\.pwsh7\package"
		}
		Main 		= $Null
		Logs		= $Null
		Package		= $Null
	}
	$Logs = [PSCustomObject]@{
		Warnings	= $null
		WarningLogs = "${LogsTemp}\warnings.log"
		Errors		= $null
		ErrorLogs	= "${LogsTemp}\errors.log"
		DebugLogs 	= "${LogsTemp}\debug.log"
		Transcript	= "${LogsTemp}\transcript.log"
	}
	if ( "$Transcript" -eq $Null ) {
		$Transcript = "$Logs.Transcript"
	}
#

if ( "$WorkingDirectory" -ne $Null ) {
	Test-Path -PathType 'Container' -Path "${WorkingDirectory}" -OutVariable 'CWDtest'
	if ( "$CWDtest" -eq $True ) {
		try {
			New-Item -ItemType 'File' -Path "${WorkingDirectory}\test.txt" -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings"
		}
		catch 
		[DirectoryNotFoundException] {
			Write-Host -Object
		}
	}
}











# Default & Fallback Locations for temporary files
	$LogsDefault	= ".\.ps-temp\logs"
	$LogsFallback	= "$env:UserProfile\.ps-temp\logs"
#

# Check '$LogPath' Parameter
	if ( "${LogPath}" -ne $null ) {
		Test-Path "${LogPath}" -PathType Container -OutVariable 'PathTest'
		if ( $PathTest -eq $True ) {
			$LogsTemp = "${LogPath}"
		} else {
			Write-Host -ForegroundColor Yellow "`n`tThe value provided for '-LogPath' was invalid."
			$LogsTemp = "$LogsDefault"
		}
	}

# Create Logs Folder
	if ( "$LogsTemp" -eq "$LogsDefault" ) {
		New-Item -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ItemType 'Directory' -Path "${LogsTemp}"
		Test-Path "${LogsTemp}" -PathType 'Container' -OutVariable 'PathTest'
		
		if ( "$PathTest" -eq $False ) {
			$LogsTemp = "$LogsFallback"
			New-Item -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ItemType 'Directory' -Path "${LogsTemp}"
			Test-Path "${LogsTemp}" -PathType 'Container' -OutVariable 'PathTest'
		}
	} elseif ( "$LogsTemp" -eq "$LogPath" ) {
		New-Item -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ItemType 'Directory' -Path "${LogsTemp}"
	}


# Set Log Ouputs
	$Logs = [PSCustomObject]@{
		Warnings	= $null
		WarningLogs = "${LogsTemp}\warnings.log"
		Errors		= $null
		ErrorLogs	= "${LogsTemp}\errors.log"
		DebugLogs 	= "${LogsTemp}\debug.log"
	}

# Create Log Files
	New-Item -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ItemType File -Path "$Logs.WarningLogs"
	New-Item -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ItemType File -Path "$Logs.ErrorLogs"


# Verify the script is being run as an Administrator
try {
	Set-ExecutionPolicy -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Errors" -WarningVariable +"$Logs.Warnings" -ExecutionPolicy 'Bypass'
}
catch 
	[System.UnauthorizedAccessException],
	[Microsoft.PowerShell.Commands.SetExecutionPolicyCommand] {
	Write-Host -ForegroundColor Yellow "`n`tThis script required administrative privilages."
	Write-Host "`tPlease run this script again from an Administrative PowerShell,"
	Write-Host "or Right-Click the '.ps1' file and 'Run as Administrator'."
	Write-Debug "$_" | Out-File -Path "$Logs.DebugLogs" -Append
}

#======================================================

# Declare empty MSI variable
New-Variable -Name 'PwshMSI' -Scope 'Script'

# MSI Default Folders
	$DefaultMSI 	= ".\package\msi"
	$FallbackMSI	= "$env:UserProfile\.ps-temp\package\msi"
	$UserDownloads	= "$env:UserProfile\Downloads"

# MSI Wildcard
	$PS7 			= "PowerShell-7.?.?-win-x64.msi"

Test-Path -PathType 'Leaf' -Path "$UserDownloads\$PS7" -Outvariable 'UserDLMsiTest'
Test-Path -PathType 'Container' -Path "$DefaultMSI" -OutVariable 'DfMsiTest'
Test-Path -PathType 'Container' -Path "$FallbackMSI" -OutVariable 'FBPathTest'

if ( "$UserDLMsiTest" -eq $True ) {

	if ( "$DfMsiTest" -eq $True ) {
		Move-Item -Force -Path "$UserDownloads\$PS7" -Destination "$.\package"
		$DLMsi = "$.\package\$PS7"
	}
	
} elseif ( "$UserDLMsiTest" -eq $False ) 



Test-Path -PathType 'Container' -Path "$DefaultMSI" -OutVariable 'PathTest'
if ( "$PathTest" -eq $True ) {
	Test-Path -PathType 'Leaf' -Path "$DefaultMSI\$PS7" -OutVariable 'MsiTest'
	if ( "$MsiTest" -eq $True ) {
		$PwshMSI = "$DefaultMSI\$PS7"
	} else {
		
	}
	
} elseif ( "$PathTest" -eq $False ) {
	
	if ( "$FBPathTest" -eq $True ) {
		Test-Path -PathType 'Leaf' -Path "$DefaultMSI\$PS7" -OutVariable 'FBMsiTest'
		if ( "$FBMsiTest" -eq $True ) {
			$PwshMSI = "$FallbackMSI\$PS7"
		} else {
			Test-Path -PathType 'Leaf' -Path "$UserDownloads\$PS7" -OutVariable 'UserDLMsiTest'
		}
	}
}


# msiexec.exe /package PowerShell-7.3.0-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
