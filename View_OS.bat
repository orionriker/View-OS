echo off
title View OS Kernel Loader
cls
cd Boot
if exist Boot_sector.bat rename Boot_sector.bat Boot_sector.b
if not exist Boot_sector.bat cd..
cd System
if exist System.bat rename System.bat System.sy
if not exist System.bat cd..
cd Kernel
if exist Kernel.bat ren Kernel.bat Kernel.sys
:: Check if kernel exists
if not exist Kernel.bat goto :e
if not exist Kernel.sys goto :k
:: re-Check if kernel exists
:e
if not exist Kernel.sys goto :kernel_missing
if not exist Kernel.bat goto :k
:k
rename Kernel.sys Kernel.bat
call kernel.bat
exit

:: if the kernel file is missing then wit will come this error screen
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