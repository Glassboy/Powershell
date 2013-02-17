#$CDDrive = get-wmiobject win32_logicaldisk -filter 'DriveType=5'
$sa = New-Object -comObject Shell.Application
$sa.Namespace(17).parseName($CDDrive)
$sa.Namespace(17).ParseName($CDDrive).InvokeVerb("Eject")