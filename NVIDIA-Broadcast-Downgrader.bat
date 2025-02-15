@echo off
set version=1.0
title NVIDIA Broadcast Downgrader v%version%
whoami /groups | find "S-1-16-12288" > nul
if %errorLevel% neq 0 (
   echo Accept Administrator Privileges to continue.
   echo createObject("shell.application"^).shellExecute "%~s0", "", "", "runas", 1 > "%temp%\UAC_%~n0.vbs"
   "%temp%\UAC_%~n0.vbs"
   del "%temp%\UAC_%~n0.vbs" /q
   exit
)
pushd "%~dp0"
set "url=https://international.download.nvidia.com/Windows/broadcast/1.4.0.39/NVIDIA_Broadcast_v1.4.0.39.exe"
set "dir=C:\Program Files\NVIDIA Corporation\NVIDIA Broadcast"
echo NVIDIA Broadcast Downgrader v%version%
echo -------------------------------------------------
echo Downloading...
curl -L -o "NVIDIA_Broadcast_v1.4.0.39.exe" %url%
echo -------------------------------------------------
echo Installing Setup...
start /wait "" "NVIDIA_Broadcast_v1.4.0.39.exe"
echo -------------------------------------------------
echo Update Block:
if not exist "%dir%\NVIDIA Broadcast UI.exe" set /p "dir=Set the NVIDIA Broadcast (e.g. C:\Program Files\NVIDIA Broadcast): "
netsh advfirewall firewall add rule name="NVIDIA Broadcast Downgrader" dir=in action=block profile=any program="%dir%\NVIDIA Broadcast UI.exe"
netsh advfirewall firewall add rule name="NVIDIA Broadcast Downgrader" dir=out action=block profile=any program="%dir%\NVIDIA Broadcast UI.exe"
(
   echo @echo off
   echo netsh advfirewall firewall delete rule name="NVIDIA Broadcast Downgrader"
   echo pause
) > Update-Block-Remove.bat
echo ##################################################
echo Install finish.
echo If you need remove Update Block run Update-Block-Remove.bat.
pause >nul
exit