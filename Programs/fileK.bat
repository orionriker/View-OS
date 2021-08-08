echo off
cd..
cd Drivers
call VGA.bat
cd..
cd Disk
title View OS -FileK
set foldername=0
set filename=0
set file=0
set delfile=0
cls

:filek
echo ════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo             ██████████    ██    ██            ██████████   ██   ██
echo             ██                  ██            ██           ██  ██
echo             ██                  ██            ██           ██ ██
echo             ██████████    ██    ██            ██████████   ████            Type help for a list of commands!
echo             ██            ██    ██            ██           ████
echo             ██            ██    ██            ██           ██ ██
echo             ██            ██    ██            ██           ██  ██
echo             ██            ██    ██████████    ██████████   ██   ██
echo                                                                       BETA 1.0
echo ════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

:commands
set /p command=View OS FileK: 
if "%command%"== "mkdir" goto :mkdir1
if "%command%"== "mkfile" goto :mkfile
if "%command%"== "paste" goto :paste
if "%command%"== "copy" goto :copy
if "%command%"== "delete" goto :rmfile1
if "%command%"== "list" goto :list
if "%command%"== "opentxt" goto :opentxt1
if "%command%"== "help" goto :help
if "%command%"== "clear" goto :clear
if "%command%"== "exit" goto :exit

:unknowncmd
echo Unkown Command! Type help
goto commands

:help
echo View OS FileK: ═════════════════════════════════Help══════════════════════════════════
echo View OS FileK: 
echo View OS FileK:  help        shows this command
echo View OS FileK:  mkdir       make a folder
echo View OS FileK:  rmdir       remove a folder
echo View OS FileK:  copy        copy a file
echo View OS FileK:  paste       paste a file from copy command
echo View OS FileK:  rmfile      remove a file
echo View OS FileK:  opentxt     open a text file
echo View OS FileK:  list        List Files in disk
echo View OS FileK:  exit        Exit FileK
echo View OS FileK:  clear       Clear command line
echo View OS FileK:  
echo View OS FileK: ═══════════════════════════════════════════════════════════════════════
echo View OS FileK:                  For full guide Check Out the GitHub!
echo View OS FileK: ═══════════════════════════════════════════════════════════════════════
goto commands

:mkdir1
set /p foldername=name-of-folder: 
goto mkdir

:mkdir
mkdir %foldername%
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

:clear
cls
goto filek

:opentxt1
set /p file=name-of-text-file: 
goto opentxt

:opentxt
echo ╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo ║ Text File %file%
echo ╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
      for /f "tokens=*" %%s in (%file%) do (
         echo ║ %%s
      )
echo ╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
goto commands

:list
dir
goto commands

:exit
cd..
cd System
set viewosopend=1
call System.bat