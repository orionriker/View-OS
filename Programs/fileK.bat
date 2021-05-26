echo off
cd..
cd Drivers
call VGA.bat
cd..
cd Disk
title Ker_OS -FileK
set foldername=0
set filename=0
set file=0
set delfile=0
cls

echo ========================================================================================================================
echo.
echo                       ##########    ##    ##            ##########   ##   ##
echo                      ##            ##    ##            ##           ##  ##
echo                     ##                  ##            ##           ## ##
echo                   ##########    ##    ##            ##########    ####       Type help for a list of commands!
echo                  ##            ##    ##            ##            ####
echo                ##            ##    ##            ##            ##   ##
echo              ##            ##    ##            ##             ##     ##
echo             ##            ##    ##########    ##########     ##       ##
echo                                                                             BETA 1.0
echo ========================================================================================================================

:commands
set /p command=FileK: 
if "%command%"== "mkdir" goto :mkdir1
if "%command%"== "mkfile" goto :mkfile
if "%command%"== "paste" goto :paste
if "%command%"== "copy" goto :copy
if "%command%"== "delete" goto :rmfile1
if "%command%"== "list" goto :list
if "%command%"== "opentxt" goto :opentxt1
if "%command%"== "help" goto :help

:unknowncmd
echo Unkown Command! Type help
goto commands

:help
echo FileK: =================================Help==================================
echo FileK: 
echo FileK:  help
echo FileK:  mkdir
echo FileK:  rmdir
echo FileK:  copy
echo FileK:  paste
echo FileK:  rmfile
echo FileK:  opentxt
echo FileK:  list
echo FileK:  
echo FileK: =======================================================================
echo FileK:                For full guide Check Out the GitHub!
echo FileK: =======================================================================
goto commands

:mkdir1
set /p foldername=name-of-folder: 
goto mkdir

:mkdir
mkdir %foldername%
cd..
cd Programs
cd Filek_LOGS
echo [%time%]_User_Made_Folder:%foldername%>> %date%.log
cd..
cd..
cd Disk
goto commands

:mkfile
goto commands

:paste
goto commands

:copy
goto commands

:rmfile1
set /p delfile=File name: 
goto rmfile

:rmfile
del"%delfile%"
goto commands

:opentxt1
cd..
cd Programs
cd Filek_LOGS
set /p file=name-of-text-file: 
cd..
cd..
cd Disk
goto opentxt

:opentxt
cd..
cd Programs
cd Filek_LOGS
echo [%time%]_User_Opened_File:%file%>> %date%.log
cd..
cd..
cd Disk
echo ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo ║ Text File %file%
echo ╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      for /f "tokens=*" %%s in (%file%) do (
         echo ║ %%s
      )
echo ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
goto commands

:list
cd..
cd Programs
cd Filek_LOGS
echo [%time%]_User_Listed>> %date%.log
cd..
cd..
cd Disk
dir
goto commands