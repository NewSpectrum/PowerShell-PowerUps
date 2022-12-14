function Set-Esc {
	$Esc = [PSCustomObject]@{
		Format = [PSCustomObject]@{
			rst			= "`e[0m"
			tab			= "`t"
			br			= "`n"
			brtab		= "`n`t"
			rstbr		= "`e[0m`n"
			rbt			= "`e[0m`n`t"
		}
		FgColors = [PSCustomObject]@{
			# 'b' = Bold
			Orange01	= "`e[38;5;208m"
			bOrange01	= "`e[1;38;5;208m"
			Orange02	= "`e[38;5;214m"
			bOrange02	= "`e[1;38;5;214m"
			LtBlue01	= "`e[38;5;45m"
			bLtBlue01	= "`e[1;38;5;45m"
		}
		BgColors = [PSCustomObject]@{
			Orange01	= "`e[48;5;202m"
			DkBlue01	= "`e[48;5;18m"
		}
		ColorCombos = [PSCustomObject]@{
			# Background_Foreground
			DkBlue_Orange01		= "`e[48;5;18;38;5;214m"
			bDkBlue_Orange01	= "`e[1;48;5;18;38;5;214m"
		}
	}
	
	$Esc.Format | ForEach-Object -Process {
		Set-Variable -Name "${Help}" -Value $_.Me -Visibility 'Private' -Scope 'Public' -Force -PassThru
	}
}
Set-Esc