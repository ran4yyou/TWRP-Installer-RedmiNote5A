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

:: ====== ENTER FASTBOOT MODE ======
color 0E
echo [ ACTION ]  Rebooting to fastboot mode...
adb reboot bootloader
timeout /t 5 >nul

:: ====== FLASHING ORANGEFOX ======
color 0C
echo [ FLASH ]  Erasing old recovery..
fastboot erase recovery
echo [ FLASH ]  Flashing new OrangeFox...
fastboot flash recovery recovery.img
echo [ BOOT ]   Booting into OrangeFox...
fastboot boot recovery.img

:: ====== FINISHED ======
color 0A
echo [DONE]   Rebooting to recovery...
adb reboot recovery
echo.
echo  ==============================================================
echo   PROCESS SUCCEEDED!
echo   OrangeFox Recovery has been installed on your device.
echo  ==============================================================
echo.
pause
exit

