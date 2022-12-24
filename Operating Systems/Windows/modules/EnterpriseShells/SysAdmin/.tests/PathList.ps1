$Policy = $(Get-ExecutionPolicy)
if ( $Policy -ne "Bypass" -or "Unrestricted" ) {
	Set-ExecutionPolicy -Scope 'Process' -ExecutionPolicy 'Bypass'
}

function Repair-SystemPATH {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory=$False,
		           ValueFromPipelineByPropertyName=$True)]
		[Alias("User","U")]
		[string]$Username,
		
		[Parameter(Mandatory=$False,
		           ValueFromPipelineByPropertyName=$True)]
		[Alias("Old")]
		[string]$OldUser,
		
		[Parameter(Mandatory=$False,
		           ValueFromPipelineByPropertyName=$True)]
		[Alias("RE","S","Search")]
		[string]$RegEx,
		
		[Parameter(Mandatory=$False,
		           ValueFromPipelineByPropertyName=$True)]
		[Alias("R")]
		[string]$Replace,
		
		[Parameter(Mandatory=$False,
		           ValueFromPipelineByPropertyName=$True)]
		[Alias("T","Test")]
		[switch]$MatchTest
	)
	
	if ( $Username -eq $Null ) {
		$Username = $( Read-Host -Prompt "Enter your current Username" )
	}
	if ( $OldUser -eq $Null ) {
		$OldUser = "Mayo&Ayo"
	}
	if ( $RegEx -eq $Null ) {
		$RegEx = "(.*)(\\${OldUser}\\)(.*\n)"
	}
	if ( $Replace -eq $Null ) {
		$Replace = "$1\\${Username}\\$3"
	}
	
	
	
	$PathList = @(
		$( $env:PATH -split ';' )
	)
	
	if ( $MatchTest -eq $True ) {
		$MatchTest = $( ForEach ( $item in $PathList ) {
			$_ -match "${RegEx}" -split ' '
			}
		)
	} else {
		$NewPATH = $( ForEach ( $item in $PathList ) {
			$_ -match "${RegEx}" -replace "${Replace}" -split ' '
			}
		)
	}
	
	Write-Host "$NewPath"
}
