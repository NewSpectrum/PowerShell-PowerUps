# Set Preference Variables
$WarningPreference		= "SilentlyContinue"
$ConfirmPreference		= "None"
$ErrorActionPreference	= "SilentlyContinue"
$ErrorView				= "CategoryView"

# Set Script Parameters
[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           Position=0,
				   ParameterSetName="Directories",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("CWD","Path")]
		[string]$WorkingDirectory,
		
		[Parameter(Mandatory=$False,
				   ParameterSetName="Directories",
				   ValueFromPipeline=$True,
				   ValueFromPipelineByPropertyName=$True)]
		[Alias("LP","Logs")]
		[string]$LogPath
	)

# Verify the script is being run as an Administrator
try {
	Set-ExecutionPolicy -Force -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Var.Errors" -WarningVariable +"$Logs.Var.Warnings" -ExecutionPolicy 'Bypass'
}
catch 
	[System.UnauthorizedAccessException],
	[Microsoft.PowerShell.Commands.SetExecutionPolicyCommand] {
	Write-Host -ForegroundColor Yellow "`n`tThis script required administrative privilages."
	Write-Host "`tPlease run this script again from an Administrative PowerShell,"
	Write-Host "or Right-Click the '.ps1' file and 'Run as Administrator'."
	Write-Debug "$_" | Out-File -Path "$Logs.Files.DebugLogs" -Append
}



# Set Working Directories
	$CWD = [PSCustomObject]@{
		Defaults = [PSCustomObject]@{
			Main	= "$env:UserProfile\.pwsh7"
			Logs	= "$env:UserProfile\.pwsh7\logs"
			Package	= "$env:UserProfile\.pwsh7\package"
			MSI		= "$env:UserProfile\.pwsh7\package\msi"
		}
		Fallbacks = [PSCustomObject]@{
			Main	= ".\.pwsh7"
			Logs	= ".\.pwsh7\logs"
			Package	= ".\.pwsh7\package"
			MSI		= "$env:UserProfile\.pwsh7\package\msi"
		}
		Final = [PSCustomObject]@{
		Main 		= $Null
		Logs		= $Null
		Package		= $Null
	}
	
# Setup Logging
	$Logs = [PSCustomObject]@{
		Var	= [PSCustomObject]@{
			Warnings	= $Null
			Errors		= $Null
			Debug		= $Null
			Info		= $Null
		}
		Files = [PSCustomObject]@{
			WarningLogs = "${LogsTemp}\warnings.log"
			ErrorLogs	= "${LogsTemp}\errors.log"
			DebugLogs 	= "${LogsTemp}\debug.log"
			Transcript	= "${LogsTemp}\transcript.log"
		}
	}
	if ( "$Transcript" -eq $Null ) {
		$Transcript = "$Logs.Files.Transcript"
	}
#

# Set Messages
	$MSG = [PSCustomObject]@{
		Warnings = [PSCustomObject]@{
			Test	= "Test Warning"
		}
		Errors = [PSCustomObject]@{
			Params	= [PSCustomObject]@{
				CWD = [PSCustomObject]@{
					Invalid = $Null
				}
				Logs = [PSCustomObject]@{
					Invalid = $Null
				}
			}
			Test	= "Test Error"
		}
		Help = [PSCustomObject]@{
			Test	= "Test Help"
		}
	}




if ( "$WorkingDirectory" -ne $Null ) {
	Test-Path -PathType 'Container' -Path "${WorkingDirectory}" -OutVariable 'CWDtest'
	if ( "$CWDtest" -eq $True ) {
		try {
			New-Item -ItemType 'File' -Path "${WorkingDirectory}\test.txt" -ErrorAction 'SilentlyContinue' -ErrorVariable +"$Logs.Var.Errors" -WarningVariable +"$Logs.Var.Warnings"
		}
		catch 
		[DirectoryNotFoundException] {
			Write-Host -Object ""
			Write-Error "${MSG.Errors.Params.CWD.Invalid}"
		}
	}
} else {
	try {
		New-Item -ItemType 'File' -Path "$env:UserProfile\test.txt"
	}
	catch {
		#
	}
	finally {
		#
	}
}

Test-Path -PathType 'Leaf' -Path "$env:UserProfile\test.txt" -OutVariable 'HomeTest'
if ( "$HomeTest" -eq $True ) {
	Remove-Item -Force -Path "$env:UserProfile\test.txt"
	$CWD.Final = $CWD.Defaults
}

# Create Directories
	$CWD.Final | ForEach-Object -Process {
		New-Item -Force -PassThru -ItemType 'Directory' -Path "$_"
	}
	$MainCWD = Get-Item "$CWD.Defaults.Main"
	$MainCWD.attributes = "Hidden"
	
	$Logs.Files | ForEach-Object -Process {
		New-Item -Force -PassThru -ItemType 'File' -Path "$_"
	}

$VerifyCWD = Get-ChildItem -Force -Recurse -Path "${MainCWD}" | %{
	[PSCustomObject]@{
		Name	= $_.Name
		Path	= $_.Path
	}
}


$HostInfo = [PSCustomObject]@{
	PowerShell		= $Null
	Windows			= $Null
	System			= $Null
}

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



$WinGetDir = "C:\Users\rjoub\AppData\Local\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState"







#======================================================

# Declare empty MSI variable
New-Variable -Name 'PwshMSI' -Scope 'Script'

# MSI Default Folders
	$DefaultMSI 	= ".\package\msi"
	$FallbackMSI	= "$env:UserProfile\.ps-temp\package\msi"
	$UserDownloads	= "$env:UserProfile\Downloads"

# MSI Wildcard
	$PS7 			= "PowerShell-7.*.msi"

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


# https://github.com/PowerShell/PowerShell/releases/download/v7.3.1/PowerShell-7.3.1-win-x64.msi

# msiexec.exe /package PowerShell-7.3.0-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1
