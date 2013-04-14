@ECHO OFF
REM test whether system is 32 or 64 bit by comparing Program File variables
if "%ProgramFiles%" == "%ProgramFiles(x86)%" goto x86_PATH
if "%ProgramFiles%" == "%ProgramW6432%" goto x64_PATH

:x64_PATH
@set iTunesLoc=%ProgramFiles(x86)%\iTunes
goto :Firewall

:x86_PATH
@set iTunesLoc=%ProgramFiles%\iTunes
goto :Firewall

REM Create Firewall rules
:Firewall
netsh advfirewall firewall add rule action=allow profile=any protocol=any enable=yes direction=out name="iTunes" program="%iTunesLoc%\iTunes.exe"
netsh advfirewall firewall add rule action=allow profile=any protocol=any enable=yes direction=in name="iTunes" program="%iTunesLoc%\iTunes.exe"
netsh advfirewall firewall add rule action=allow profile=private protocol=TCP enable=yes direction=in name="iTunes Home Sharing" localport=3689
netsh advfirewall firewall add rule action=allow profile=private protocol=UDP enable=yes direction=in name="iTunes Home Sharing" localport=5353