function Set-EscVars {
	$rst	= "`e[0m"
	$br		= "`n"
	$tab	= "`t"
	$brtab	= "`n`t"
	$rbt	= "`e[0m `n`t"
	
	$Orange		= "`e[38;5;214m"
	$bOrange	= "`e[1;38;5;214m"
	
	$Error01	= "${Orange}${tab}| "
	$bError01	= "${bOrange}${tab}| "
}

$ExecPolicy		= $( Get-ExecutionPolicy )


if ( $ExecPolicy != "Bypass" -or "Unrestricted" ) {
	try {
		Set-ExecutionPolicy -Scope 'Process' -ExecutionPolicy 'Bypass'
	}
	catch [System.UnauthorizedAccessException],
	[System.Management.Automation.CmdletInvocationException]
	{
		Write-Host "`n"
		throw "Error: Insufficient Permissions"
		Write-Host "`n`tThis script requires Administrative Privileges."
	}
}


Write-Host "$ErrorVar" > .\policy-catch.txt


Get-Help 'shells' |
Sort-Object -Property Category, Name |
Format-Table -AutoSize -Wrap -GroupBy Category -Property Name, Category, Synopsis

Get-Help 'shells' -Category HelpFile | Format-List -Property *
