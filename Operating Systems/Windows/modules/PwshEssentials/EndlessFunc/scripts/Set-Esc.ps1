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
#Set-Esc


function Set-PsEscColors {
	$PsColors = [PSCustomObject]@{
		Reset 		= "`e[0m"
		Br 			= "`n"
		Tab			= "`t"
		BrTab		= "`n`t"
		RsBr		= "`e[0m `n"
		RsBrTab		= "`e[0m `n`t"
		FgColors = [PSCustomObject]@{
			Gray		= "`e[90m"
			bGray		= "`e[1;90m"
			White		= "`e[97m"
			bWhite		= "`e[1;97m"
			
			Red			= "`e[91m"
			RedD		= "`e[31m"
			bRed		= "`e[1;91m"
			bRedD		= "`e[1;31m"
			
			Green		= "`e[92m"
			GreenD		= "`e[32m"
			bGreen		= "`e[1;92m"
			bGreenD		= "`e[1;32m"
			
			Yellow		= "`e[93m"
			YellowD		= "`e[33m"
			bYellow		= "`e[1;93m"
			bYellowD	= "`e[1;33m"
			
			Blue		= "`e[94m"
			BlueD		= "`e[34m"
			bBlue		= "`e[1;94m"
			bBlueD		= "`e[1;34m"
			
			Magenta		= "`e[95m"
			MagentaD	= "`e[35m"
			bMagenta	= "`e[1;95m"
			bMagentaD	= "`e[1;35m"
			
			Cyan		= "`e[96m"
			CyanD		= "`e[36m"
			bCyan		= "`e[1;96m"
			bCyanD		= "`e[1;36m"
		}
		Sim = [PSCustomObject]@{
			Params		= "$Esc.Color.Gray"
			Strings		= "$Esc.Color.CyanD"
			Command		= "$Esc.Color.Yellow"
		}
	}
}