

# Create a variable for your Current Working Directory
VarName=$( Get-Location )

# The alias for 'Get-Location' is also the same as Bash:
VarName=$(pwd)

# Verify the path was assigned correctly by simply entering the '$VarName'
$VarName


# I prefer to set variables for paths to be used in Cmdlets
# Makes it easier to make corrections or reference them later
Set-Variable -Name 'NewDir' -Value 'FolderName' -PassThru

# Optional: Navigate to target directory & verify folder by its contents
Set-Location -Path "Z:\" -PassThru
Get-ChildItem | Format-Table -Property Name, Length, LastWriteTime

# If you used 'Set-Location':
# You can create a variable from your Current Working Directory
Set-Variabke -PassThru -Name 'NewDirPath' -Value $(Get-Location)

# If you didn't use 'Set-Location':
# You can create new items anywhere regardless of your CWD
Set-Variabke -PassThru -Name 'NewDirPath' -Value "Z:\"

# Create the new folder, regardless of your CWD:
New-Item -ItemType 'Directory' -Path "$NewDirPath" -Name "$NewDir"


#=========

# The same set of commands as above, but with built-in aliases
NewDir = "FolderName"
cd "Z:\"
ls | Format-Table -Property Name, Length, LastWriteTime
NewDirPath = $(pwd)
New-Item -ItemType 'Directory' -Path "$NewDirPath" -Name "$NewDir"

