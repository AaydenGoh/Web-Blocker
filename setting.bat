@Echo Off
SetLocal DisableDelayedExpansion
wmic path win32_localtime get dayofweek | findstr /i "0 1 2 3 4 5 6" > day.txt
set /p day=<day.txt
echo day: %day%
del day.txt 2>nul

if %day% == 1 goto :process
if %day% == 2 goto :process
if %day% == 3 goto :process
if %day% == 4 goto :process
if %day% == 5 goto :process

goto :skip

:process
::echo [+] is weekday
for /f "tokens=1 delims=/:" %%i in ("%time%") do set "hournum=%%i"
if %hournum% leq 21 goto :addhost
::echo [-] Out of time rage
goto :end

:addhost
::echo [+] add host
xcopy %SystemRoot%\System32\drivers\etc\Af\hosts %SystemRoot%\System32\drivers\etc\ /Y
goto :end

:skip
::echo [-] is not weekend

:end
::echo [+] DONE
