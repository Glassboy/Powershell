#H:\>powershell -command "& '\empty_temp.ps1'"
$pslog = new-object System.Diagnostics.Eventlog (
   "System", ".")
$pslog.Source="Maintenance Script"
ri -rec $env:windir\temp\* -force
$pslog.WriteEntry("$env:windir\temp was emptied by the maintenance script.")
ri -rec $env:temp\* -force
$pslog.WriteEntry("$env:temp was emptied by the maintenance script.")
if ($env:temp -ne $env:tmp)
  { ri -rec $env:tmp\* -force 
    $pslog.WriteEntry("$env:tmp was emptied by the maintenance script.")
  }
