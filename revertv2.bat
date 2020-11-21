@Echo Off
SetLocal DisableDelayedExpansion

SET DAY=%DATE:~0,3%
IF [%DAY%]==[Sun] goto :process
IF [%DAY%]==[Sat] goto :process

goto :end

:process
echo sat
xcopy %SystemRoot%\System32\drivers\etc\Ori\hosts %SystemRoot%\System32\drivers\etc\ /Y

:end