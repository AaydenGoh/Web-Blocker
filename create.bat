@Echo Off
SetLocal DisableDelayedExpansion

mkdir %SystemRoot%\System32\drivers\etc\Ori
mkdir %SystemRoot%\System32\drivers\etc\Af
xcopy %SystemRoot%\System32\drivers\etc\hosts %SystemRoot%\System32\drivers\etc\Ori
xcopy %SystemRoot%\System32\drivers\etc\hosts %SystemRoot%\System32\drivers\etc\Af

SET mypath=%~dp0
::echo %mypath%
::echo %mypath:~0,-1%

xcopy %mypath%revert.bat %SystemRoot%\System32\drivers\etc
xcopy %mypath%revertv2.bat %SystemRoot%\System32\drivers\etc
xcopy %mypath%setting.bat %SystemRoot%\System32\drivers\etc

SCHTASKS /CREATE /SC ONLOGON /TN "HostSetting" /TR "%SystemRoot%\System32\drivers\etc\setting.bat" /RL HIGHEST
SCHTASKS /CREATE /SC DAILY /TN "HostRevert_Day" /TR "%SystemRoot%\System32\drivers\etc\revert.bat" /ST 22:00 /RL HIGHEST
SCHTASKS /CREATE /SC ONLOGON /TN "HostRevert_Sat" /TR "%SystemRoot%\System32\drivers\etc\revertv2.bat" /RL HIGHEST