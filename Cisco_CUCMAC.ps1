#requires -version 1
<#
.SYNOPSIS
	Creates data file for Cisco Unified Communications Manager Attendant Console

.DESCRIPTION
	This script creates the data file needed for Cisco Unified Communications Manager Attendant Console, typically installed on Receptionist's PCs.

.PARAMETER <Parameter_Name>
    None

.INPUTS
	None

.OUTPUTS
	None

.NOTES
	Version: 		1.0
	Author: 		Robert Singers
	Creation Date:	20090626
	Purpose/Change:	Initial script development
	Requires:		Quest AD Powershell cmdlets
	
.EXAMPLE
	
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

$PhoneOU = ""
$file1 = "Directory.txt"
$file2 = "CorporateDirectory.txt"

#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Get-QADUser -SizeLimit 0 -SearchRoot $PhoneOU | Select-Object Lastname, FirstName, PhoneNumber, Department | Export-CSV -NoTypeInformation $file1
gc $file1 | Foreach-Object {$_ -replace "`"", ""} | where {$_ -ne "LastName,FirstName,PhoneNumber,Department"} | sc $file2