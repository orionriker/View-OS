echo off
title Ker OS Kernel
cls
cd Boot
if exist Boot_sector.bat rename Boot_sector.bat Boot_sector.b
if not exist Boot_sector.bat cd..
cd System
if exist System.bat rename System.bat System.sy
if not exist System.bat cd..
cd Kernel
if exist Kernel.bat ren Kernel.bat Kernel.sys
rename Kernel.sys Kernel.bat
call kernel.bat
exit
