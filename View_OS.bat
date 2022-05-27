:: ViewOS is made by gamemaster123356
:: Copyright (c) gamemaster123356
:: please do not steal code
:: please do not redistribute ViewOS or any of its parts without permmision and give a link to the github page
:: this file is the file that launches ViewOS

echo off
:: set title
title View OS Kernel Loader
cls
:: check if kernel exists
cd Kernel
if exist Kernel.bat ren Kernel.bat Kernel.sys
if not exist Kernel.sys goto kernel_missing
rename Kernel.sys Kernel.bat
call kernel.bat
exit

:: if the kernel file is missing
:kernel_missing
color 2
echo.
echo.
echo.
echo.
echo                         CANNOT BOOT, KERNEL FILE MISSING!
echo.
echo.
echo.
echo.
pause
exit