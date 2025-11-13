@echo off
title OrangeFox Recovery Installer for Xiaomi Redmi Note 5A (UGGLITE)
color 0B
mode con: cols=80 lines=35

echo. 
echo  ==============================================================
echo   OrangeFox Recovery Installer for Xiaomi Redmi Note 5A (UGGLITE)
echo  --------------------------------------------------------------
echo   Created by : Wildan Hermawan
echo   Github     : https://github.com/ran4yyou
echo   Description: Flash and boot OrangeFox recovery automatically
echo  ==============================================================
ECHO.
echo  Ensure the phone is connected and USB Debugging is enabled.
echo.
timeout /t 2 >nul
:: ====== ADB PREPARATION ======
color 0A
echo [ INFO ]  Terminating running ADB processes...
taskkill /f /im "adb.exe" >nul 2>nul
cd /d %~dp0adb
adb kill-server
adb start-server
echo [ INFO ]  Checking for connected devices...
echo.
adb devices
echo.
pause
