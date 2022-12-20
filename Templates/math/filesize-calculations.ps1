


$Folder = $(Get-Item -Path "D:\Target\*")

# Use 'Measure-Item' to get the size 
	#? Output is in Kilobytes (KB)
$Folder | Measure-Item -Sum

#


# Get the Size & Convert to Megabytes
[Math]::Round((($Folder |
	Measure-Object -Sum).Sum / 1MB),2
)


<#
[Math]::Round(
   ((Get-ChildItem C:\Temp\ -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB),2
   )
#>



