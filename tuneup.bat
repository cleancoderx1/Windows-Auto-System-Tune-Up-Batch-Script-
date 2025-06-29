@echo off
title 🔧 Windows Auto System Tune-Up
color 1F

echo [1/8] Setting Disk Cleanup options...
cleanmgr /sageset:100 >nul

echo [2/8] Running Disk Cleanup silently...
cleanmgr /sagerun:100 >nul

echo [3/8] Cleaning Temp folders...
del /s /f /q %TEMP%\* >nul 2>&1
del /s /f /q C:\Windows\Temp\* >nul 2>&1
rd /s /q %TEMP% >nul 2>&1
md %TEMP% >nul 2>&1

echo [4/8] Flushing DNS cache...
ipconfig /flushdns >nul

echo [5/8] Resetting network components...
netsh winsock reset >nul
netsh int ip reset >nul

echo [6/8] Running System File Checker...
sfc /scannow >nul

echo [7/8] Repairing Windows Image...
DISM /Online /Cleanup-Image /RestoreHealth >nul

echo [8/8] Optimizing drive (skip if SSD)...
defrag C: /O >nul

echo.
echo ✅ System Tune-Up Complete.
timeout /t 5 >nul
exit
