$Policy = $( Get-ExecutionPolicy )
if ( $Policy -ne "Unrestricted" -or "Bypass" ) {
	Set-ExecutionPolicy -ExecutionPolicy 'Bypass' -Scope 'Process' 
}





Set-Variable <#
#>	-Name 'TestScript' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Private' <#
#>	-Value "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing\Create & Modify Files\Get-Attributes.ps1"

Set-Variable <#
#>	-Name 'ScriptDir' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Private' <#
#>	-Value "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing\Create & Modify Files"

Set-Variable <#
#>	-Name 'DevDir' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Private' <#
#>	-Value "D:\OneDrive - New Spectrum\Dev\Scripting\Windows Scripting\Testing\Create & Modify Files\Get-Attributes.ps1"

Set-Variable <#
#>	-Name 'GpDir' <#
#>	-Scope 'Script' <#
#>	-Visibility 'Private' <#
#>	-Value "$env:env:UserProfile\Desktop\GP"



Set-Location -PassThru -Path "${GpDir}"



$Properties	= [PSCustomObject]@{}
$Test		= $( Get-ChildItem -Path ".\*" )

$Tests | Get-Member |
	Tee-Object -Append -Variable $Properties
#








<#
#>


<#
$Properties = $(
	$Test | Get~Member
)
#>

#-PassThru