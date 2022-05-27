:: ViewOS is made by gamemaster123356
:: Copyright (c) gamemaster123356
:: please do not steal code
:: please do not redistribute ViewOS or any of its parts without permmision and give a link to the github page
:: this file is the updater this updates ViewOS to the latest version

call ../Drivers/VGA.bat

::           vars
set osver=null
set latestver=2.4
set vupdatename=null

::           get data
cd..
cd Data
ren os.dat os.bat
call os.bat
ren os.bat os.dat
ren update.dat update.bat
call
ren update.bat update.dat

::           Check
cls
Ping www.github.com -n 1 -w 1000
cls
echo Checking if there is an internet connection...
timeout 1 >nul
if errorlevel 1 (goto :error2) else (goto :continue)

:continue
if "%latestver%"=="null" goto error2
if "%osver%"=="null" goto error3
cls
echo [OK] Internet Connection
echo Checking ViewOS Version...
timeout 1 >nul
if "%osver%" gtr "%latestver%" goto error1
cls
echo [OK] Internet Connection
timeout 0 >nul
echo [OK] View OS Version
echo Checking Update Version...
timeout 1 >nul
cls
echo [OK] Internet Connection
echo [OK] View OS Version
timeout 0 >nul
echo [OK] Update Version
timeout 0 >nul
echo Done Checking!
pause
if "%latestver%" gtr "%osver%" goto update
if "%latestver%" equ "%osver%" goto alreadylatest
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║                             OOPS^^! Something Unknown Went Wrong.                                 ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
pause
exit



:update
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║                                 updating to latest version^^!                                     ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
timeout 1 >nul
cls
echo ╔══════════════════════════════════════════════════════════════════════════════════════════════════
echo ║
echo ║  Update: %vupdatename%
echo ║
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                     Want to Know more about the update? Check the Github^^!                       ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
timeout 0 >nul
echo Downloading Update...
timeout 1 >nul
echo Installing Update...
timeout 1 >nul
echo Checking Files...
timeout 1 >nul
goto updatedone

:alreadylatest
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║                        You are already using latest version of ViewOS^^!                          ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
pause
exit

:updatedone
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║                                   View OS Updated Successfully^^!                                 ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
echo Press any key to reboot into ViewOS ...
pause >nul
cd..
call View_OS.bat

::           errors
:error1
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║         Your ViewOS version is higher than the latest version did you change something^^?         ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
pause
exit

:error2
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║               You are not Connected to the internet or github is currently down                 ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
pause
exit

:error3
cls
echo ╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ║                                Your ViewOS version is Unknown                                   ║
echo ║                                                                                                 ║
echo ║                                                                                                 ║
echo ╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
pause
exit