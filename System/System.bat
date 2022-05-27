:: ViewOS is made by gamemaster123356
:: Copyright (c) gamemaster123356
:: please do not steal code
:: please do not redistribute ViewOS or any of its parts without permmision and give a link to the github page
:: this file is the system file

echo off
setlocal EnableDelayedExpansion
cls

REM Display
REM -------------------
title View OS
call :setESC
cd..
cd Drivers
if not exist VGC.bat set errname=Graphics Driver VGC Missing && set errcode=ERR_DRV_GFX_VGC_MISSING && goto errscr
call VGC.bat
cd..
cd Bin
fstoggle 1.5
cursorsize 1 /L
if "%openedprogram%"=="yes" goto :continuetovars
cd..
cd Boot
REM if not exist Boot_sector.bat set errname=Boot Sector Missing && set errcode=ERR_BOOT_SEC_MISSING && goto errscr
rename Boot_sector.bat Boot_sector.b > nul 2> nul

:continuetovars
REM Vars
REM -------------------
set osver=null
set kernelver=null
set build=null
set command=null
REM -------------------
REM FM Vars
REM -------------------
set foldername=null
set filename=null
set filenameext=null
set filefoldername=null
set filefoldernamerenameto=null
set CpDir=null
set MvDir=null
set rootpath=%~dp0
set rootpath=%rootpath:\System\=%
set vdiskpath=%rootpath%\Disk
set varpath=%vdiskpath%\var
set tmppath=%vdiskpath%\tmp
set binpath=%vdiskpath%\bin
set logpath=%varpath%\Log
set varstoragepath=%varpath%\ViewOS
set usrstoragepath=%varstoragepath%\Users

REM get os version,build,kernel version,developer
REM ----------------------------------------------------------
cd..
cd Data
if not exist os.dat set errname=File os.dat Missing && set errcode=ERR_FILE_OS_DAT_MISSING && goto errscr
ren os.dat os.bat > nul 2> nul
call os.bat > nul 2> nul
ren os.bat os.dat > nul 2> nul
cd..
cd Disk

if "%openedprogram%"=="yes" goto :command_s

REM -------------------------------------------------------------------------------
if not exist "%varstoragepath%" mkdir "%varstoragepath%"
if not exist "%usrstoragepath%" mkdir "%usrstoragepath%"
if exist "%varstoragepath%\vars.bat" call "%varstoragepath%\vars.bat"
if not exist "%varstoragepath%\vars.bat" echo break>"%varstoragepath%\vars.bat"
if "%viewosopend%"== "1" goto login

REM welcome screen
REM -------------------
cls
echo                                                                                                      ^|\     /^|
echo                                                                                                      ^| )   ( ^|
echo                                                                                                      ^| ^|   ^| ^|
echo                                                                                                      ( (   ) )
echo                                                                                                       \ \_/ / 
echo                                                                                                        \   /
echo                                                                                                         \_/
echo.
echo                                                                                                  Welcome to View OS
pause
echo set viewosopend=^1>"%varstoragepath%\vars.bat"

for /F %%i in ('dir /b /a "%usrstoragepath%\*"') do (
	goto :login
)

:register
cls
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                      Create User
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
set /p usrname="Username: "
if "%usrname%"=="null" echo E: Type a Username^^! && pause && goto register
if exist "%usrstoragepath%\%usrname%.bat" echo E: Username %usrname% is already taken^^! && pause && goto register
if "%usrname%"=="root" echo E: Username root is already taken^^! && pause && goto register
if "%usrname%"=="Root" echo E: Username Root is already taken^^! && pause && goto register
if "%usrname%"=="ROot" echo E: Username ROot is already taken^^! && pause && goto register
if "%usrname%"=="ROOt" echo E: Username ROOt is already taken^^! && pause && goto register
if "%usrname%"=="ROOT" echo E: Username ROOT is already taken^^! && pause && goto register
set /p usrpass="Password: "
if "%usrpass%"=="null" echo E: Type a Password^^! && pause && goto register
if "%usrpass%"=="root" echo E: Password root cannot be set^^! && pause && goto register
if "%usrpass%"=="Root" echo E: Password Root cannot be set^^! && pause && goto register
if "%usrpass%"=="ROot" echo E: Password ROot cannot be set^^! && pause && goto register
if "%usrpass%"=="ROOt" echo E: Password ROOt cannot be set^^! && pause && goto register
if "%usrpass%"=="ROOT" echo E: Password ROOT cannot be set^^! && pause && goto register

:regprompt
set /p regyesno="Do you Want Your Username as %usrname% and password as %usrpass% [Y/N] "
if "%regyesno%"=="Y" goto register2
if "%regyesno%"=="N" goto register
if "%regyesno%"=="y" goto register2
if "%regyesno%"=="n" goto register
if "%regyesno%"=="Yes" goto register2
if "%regyesno%"=="No" goto register
if "%regyesno%"=="YES" goto register2
if "%regyesno%"=="NO" goto register
if "%regyesno%"=="yes" goto register2
if "%regyesno%"=="no" goto register
goto regprompt

:register2
for /F %%i in ('dir /b /a "%usrstoragepath%*"') do (
	echo set vusername=^%usrname%>"%usrstoragepath%\%usrname%.bat"
	echo set vpassword=^%usrpass%>>"%usrstoragepath%\%usrname%.bat"
	echo set vrole=NormalUser>>"%usrstoragepath%\%usrname%.bat"
	goto :finishreg
)
echo set vusername=^%usrname%>"%usrstoragepath%\%usrname%.bat"
echo set vpassword=^%usrpass%>>"%usrstoragepath%\%usrname%.bat"
echo set vrole=Adminstrator>>"%usrstoragepath%\%usrname%.bat"
:finishreg
mkdir "%vdiskpath%\home\%usrname%"
goto login

:login
cls
set vusername=null
set vpassword=null
set usrname=null
set usrpass=null
for /F %%i in ('dir /b /a "%usrstoragepath%\*"') do (
	set login=true
)
if not "%login%"=="true" goto register
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                        Login
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
set /p usrname="Username: "
if not exist "%usrstoragepath%\%usrname%.bat" (
	goto :loginerror1
) else (
	call "%usrstoragepath%\%usrname%.bat"
)
set /p usrpass="Password: "
if not "%usrpass%"=="%vpassword%" goto loginerror2
goto mainsys

:loginerror1
cls
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                        Login
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo                                                                                                  Invaild Username^^! 
echo.
pause
goto login

:loginerror2
cls
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                        Login
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo                                                                                           	      Invaild Password^^! 
echo.
pause
goto login

:logout
cls
if "%vusername%"=="root" goto logouterror
cls
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                        Logout
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
set /p areyousure="Are you sure you want to Logout? [Y/N] "
if "%areyousure%"=="Y" goto login
if "%areyousure%"=="N" cls && goto command_s
if "%areyousure%"=="y" goto login
if "%areyousure%"=="n" cls && goto command_s
if "%areyousure%"=="Yes" goto login
if "%areyousure%"=="No" cls && goto command_s
if "%areyousure%"=="YES" goto login
if "%areyousure%"=="NO" cls && goto command_s
if "%areyousure%"=="yes" goto login
if "%areyousure%"=="no" cls && goto command_s
cls
goto command_s

:logouterror
cls
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                        Logout
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo                                                                                          Could not Logout are you on root?
echo.
pause
cls
goto command_s

:changepswd
cls
set apassword=null
set usrpass=null
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                   Change Password
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
set /p usrpass="Password: "
if "%usrpass%"=="null" echo E: Type a Password^^! && pause && goto changepswd
if "%usrpass%"=="root" echo E: Password root cannot be set^^! && pause && goto changepswd
if "%usrpass%"=="Root" echo E: Password Root cannot be set^^! && pause && goto changepswd
if "%usrpass%"=="ROot" echo E: Password ROot cannot be set^^! && pause && goto changepswd
if "%usrpass%"=="ROOt" echo E: Password ROOt cannot be set^^! && pause && goto changepswd
if "%usrpass%"=="ROOT" echo E: Password ROOT cannot be set^^! && pause && goto changepswd
cls
goto command_s

:mainsys
cls
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                      ^|\     /^|
echo                                                                                                      ^| )   ( ^|
echo                                                                                                      ^| ^|   ^| ^|
echo                                                                                                      ( (   ) )
echo                                                                                                       \ \_/ /
echo                                                                                                        \   /
echo                                                                                                         \_/
echo.
echo                                                                                                       View OS
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

:command_s
set command=null
set commandargs=
set commandargs2=
set commandargs3=
set commandargs4=
set commandargs5=
set commandargs6=
set commandargs7=
set commandargs8=
set commandargs9=
set commandargs10=
set commandargs11=
set commandargs12=
set commandargs13=
set commandargs14=
set commandargs15=
set commandargs16=
set commandargs17=
set commandargs18=
set commandargs19=
set commandargs20=
set /p command="%ESC%[0;33m%vusername%@ViewOS:%ESC%[32m~%ESC%[34m$%ESC%[0;0m "
for /f "tokens=2,*" %%a in ("%command%") do set commandargs=%%a
for /f "tokens=3,*" %%a in ("%command%") do set commandargs2=%%a
for /f "tokens=4,*" %%a in ("%command%") do set commandargs3=%%a
for /f "tokens=5,*" %%a in ("%command%") do set commandargs4=%%a
for /f "tokens=6,*" %%a in ("%command%") do set commandargs5=%%a
for /f "tokens=7,*" %%a in ("%command%") do set commandargs6=%%a
for /f "tokens=8,*" %%a in ("%command%") do set commandargs7=%%a
for /f "tokens=9,*" %%a in ("%command%") do set commandargs8=%%a
for /f "tokens=10,*" %%a in ("%command%") do set commandargs9=%%a
for /f "tokens=11,*" %%a in ("%command%") do set commandargs10=%%a
for /f "tokens=12,*" %%a in ("%command%") do set commandargs11=%%a
for /f "tokens=13,*" %%a in ("%command%") do set commandargs12=%%a
for /f "tokens=14,*" %%a in ("%command%") do set commandargs13=%%a
for /f "tokens=15,*" %%a in ("%command%") do set commandargs14=%%a
for /f "tokens=16,*" %%a in ("%command%") do set commandargs15=%%a
for /f "tokens=17,*" %%a in ("%command%") do set commandargs16=%%a
for /f "tokens=18,*" %%a in ("%command%") do set commandargs17=%%a
for /f "tokens=19,*" %%a in ("%command%") do set commandargs18=%%a
for /f "tokens=20,*" %%a in ("%command%") do set commandargs19=%%a
for /f "tokens=21,*" %%a in ("%command%") do set commandargs20=%%a
for /f "tokens=1,*" %%a in ("%command%") do set command=%%a
set fullcommand=%command%
if not "%fullcommand%"=="" if not "%fullcommand%"=="null" call :logger 2 "user %vusername% ran command: %fullcommand%"
REM ------------------------
REM CORE CMDS
REM ------------------------
if "%command%"== "help"  goto :help
if "%command%"== "clear"  goto :clear
if "%command%"== "launch"  goto :launch
if "%command%"== "date"  goto :date
if "%command%"== "time"  goto :time
if "%command%"== "verfetch"  goto :about
if "%command%"== "reboot"  goto :reboot
if "%command%"== "shutdown"  goto :shutdown
if "%command%"== "update"  goto :update
if "%command%"== "su" goto :superuser
if "%command%"== "logout" goto :logout
if "%command%"== "null" goto :command_s
if "%command%"== "cls" goto :clear
if "%command%"== "args-test" goto :vosdk
REM ------------------------
REM FILE SYSTEM CMDS
REM ------------------------
if "%command%"== "mkdir" goto :fm_mkdir
if "%command%"== "rmdir" goto :fm_rmdir
if "%command%"== "mkfil" goto :fm_mkfil
if "%command%"== "rmfil" goto :fm_rmfil
if "%command%"== "copy" goto :fm_copy
if "%command%"== "cut" goto :fm_cut
if "%command%"== "cat" goto :fm_cat
if "%command%"== "cd" goto :fm_cd
if "%command%"== "ls" goto :fm_ls
if "%command%"== "rm" goto :rmcmd

echo %ESC%[0;91m%command% is Not a External Command, Or a View OS Command Type help For a List of Commands^^!%ESC%[0;0m
call :logger 0 "%fullcommand% is Not a External Command, Or a View OS Command"
goto command_s


REM Core
REM ------------------------

:vosdk
echo %ESC%[94mArgs Test - VOSDK ViewOS Dev Kit%ESC%[0m
echo ------------------------------------------
echo Arg1: %commandargs%
echo Arg2: %commandargs2%
echo Arg3: %commandargs3%
echo Arg4: %commandargs4%
echo Arg5: %commandargs5%
echo Arg6: %commandargs6%
echo Arg7: %commandargs7%
echo Arg8: %commandargs8%
echo Arg9: %commandargs9%
echo Arg10: %commandargs10%
echo ------------------------------------------
echo Arg11: %commandargs11%
echo Arg12: %commandargs12%
echo Arg13: %commandargs13%
echo Arg14: %commandargs14%
echo Arg15: %commandargs15%
echo Arg16: %commandargs16%
echo Arg17: %commandargs17%
echo Arg18: %commandargs18%
echo Arg19: %commandargs19%
echo Arg20: %commandargs20%
goto command_s

:help
echo %ESC%[94mView OS - List of commands                                %ESC%[0m
echo %ESC%[94m═════════════════════════════════════════════════════════════════%ESC%[0m
echo.
echo %ESC%[94mView OS Core System %ESC%[0m
echo.
echo * help       Shows this AKA list of commands
echo * clear      Clears the command line
echo * launch     Launch a program
echo * date       Shows the current date
echo * time       Shows the current time
echo * verfetch   Shows the version and about View OS
echo * shutdown   Shutdown View OS
echo * reboot     Reboot View OS
echo * update     Checks and Updates View OS
echo.
echo %ESC%[94mView OS User Management %ESC%[30;107m BETA %ESC%[0m
echo.
echo * createusr  Create a new user
echo * renameusr  Rename a user ^| Args: ^<username^>
echo * editusr  	Edit a user ^| Args: ^<username^>
echo * listusr    Lists all users
echo * su         login as Root User ^| Args: logout
echo * logout     Logout From Current User
echo.
echo %ESC%[94mView OS File System %ESC%[30;107m WIP %ESC%[0m
echo.
echo * mkdir      Make a folder
echo * rmdir      Remove a folder
echo * mkfil      Make a file
echo * rmfil      Remove a file
echo * copy       Copy a File/folder
echo * cut        Cut a File/Folder
echo * paste      Paste a File/folder
echo * cat        Output contents of a file as RAW
echo * ls         List Files/Folders
echo.
echo %ESC%[94m═════════════════════════════════════════════════════════════════%ESC%[0m
set command=null
timeout 0 >nul
goto command_s

:clear
set command=null
cls
goto command_s

:date
set command=null
echo Current Date: %date%
goto command_s

:time
set command=null
echo Current Time: %time%
goto command_s

REM User Management
REM ---------------------------

:superuser
set command=null
if not "%commandargs%"=="" (
	if "%commandargs%"=="logout" (
		if not "%vusername%"=="root" echo %ESC%[0;91mE: You are not on Root^^!%ESC%[0;0m && goto command_s
		goto login
		call :logger 1 "user %vusername% loggedout from root account"
	) else (
		if "%commandargs%"=="changepswd" (
			if not "%vusername%"=="root" echo %ESC%[0;91mE: You are not on Root^^!%ESC%[0;0m && goto command_s
			set /p usrpass="Current Root Password: "
		      if "%usrpass%"=="%vrootpswd%" echo hello world
			set /p
		) else (
			echo %ESC%[0;91mE: Invaild Arguments!%ESC%[0;0m
			goto command_s
		)
	)
)
set /p usrpass="Root Password: "
if not "%usrpass%"=="root" (
	echo %ESC%[0;91mE: Invaild Password!%ESC%[0;0m
	call :logger 0 "user %vusername% could not login to root account because wrong pswd"
	goto command_s
)
call :logger 1 "user %vusername% logged into root account"
set vusername=root
goto command_s


REM Launch
REM ---------------------------


:launch
set command=null
if not "%commandargs%"=="" (
	if exist %commandargs%.bat (
		cd..
		cd Programs
		call :logger 2 "user %vusername% launched program: %commandargs%"
		call %commandargs%.bat 2>NUL
		if errorlevel 1 echo %ESC%[0;91mE: The program didn't run successfully^^!%ESC%[0;0m && call :logger 0 "user %vusername% launched program ran unsuccessfully" && goto :command_s
	) else (
		echo %ESC%[0;91mE: No such program found^^!%ESC%[0;0m
		goto :command_s
	)
)
echo %ESC%[0;91mE: Please enter a program name^^!%ESC%[0;0m
goto :command_s



REM About ViewOS
REM ---------------------------

:about
set command=null
cd..
cd Data
ren os.dat os.bat
call os.bat
ren os.bat os.dat
echo.
echo  %ESC%[94m^|\     /^|%ESC%[0m
echo  %ESC%[94m^| )   ( ^|          %ESC%[92mVersion: %ESC%[33m%osver%%ESC%[0m
echo  %ESC%[94m^| ^|   ^| ^|          %ESC%[92mKernel Version: %ESC%[33m%kernelver%%ESC%[0m
echo  %ESC%[94m( (   ) )          %ESC%[92mBuild: %ESC%[33m%build%%ESC%[0m
echo  %ESC%[94m \ \_/ /           %ESC%[92mDeveloper: %ESC%[33mgamemaster123356%ESC%[0m
echo  %ESC%[94m  \   /%ESC%[0m            %ESC%[92mViewFS Version: %ESC%[33m%viewfsver%%ESC%[0m
echo  %ESC%[94m   \_/%ESC%[0m
echo.
cd..
cd Disk
goto command_s

REM Reboot and Shutdown
REM ---------------------------

:shutdown
set command=null
cd..
cd Boot
ren Boot_shutdown.b Boot_shutdown.bat
call Boot_shutdown.bat
dir
pause
if not exist Boot_shutdown.bat goto :serror

:reboot
set command=null
cd..
cd Boot
ren Boot_reboot.b Boot_reboot.bat
call Boot_reboot.bat
dir
pause
if not exist Boot_reboot.bat goto :rerror

:update
cls
set command=null
if not exist updater.bat cd..\System
call updater.bat
echo %ESC%[0;91mE: Error Could not Update%ESC%[0;0m
cd..\Disk
goto command_s

:serror
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                      ^|\     /^|
echo                                                                                                      ^| )   ( ^|
echo                                                                                                      ^| ^|   ^| ^|
echo                                                                                                      ( (   ) )
echo                                                                                                       \ \_/ / 
echo                                                                                                        \   /
echo                                                                                                         \_/
echo.
echo                                                                                     Error Could not shutdown for an unknown reason!
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
pause
goto mainsys

:rerror
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo                                                                                                      ^|\     /^|
echo                                                                                                      ^| )   ( ^|
echo                                                                                                      ^| ^|   ^| ^|
echo                                                                                                      ( (   ) )
echo                                                                                                       \ \_/ / 
echo                                                                                                        \   /
echo                                                                                                         \_/
echo.
echo                                                                                     Error Could not reboot for an unknown reason!
echo ═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
pause
goto mainsys

REM ===========================
REM        File System
REM ===========================

:fm_mkdir
set foldername=%commandargs%
call :foldernamecheck3
mkdir "%foldername%" 2>NUL >NUL
echo %ESC%[0;92mSuccessfully Created Folder %foldername%!%ESC%[0;0m
set foldername=null
goto command_s

:fm_rmdir
set foldername=%commandargs%
call :foldernamecheck2
rmdir "%foldername%" 2>NUL >NUL
echo %ESC%[0;92mSuccessfully Deleted Folder %foldername%!%ESC%[0;0m
set foldername=null
goto command_s

:fm_mkfil
set filename=%commandargs%
call :filenamecheck3
REM. > "%filename%" 2>NUL >NUL
echo %ESC%[0;92mSuccessfully Created File %filename%!%ESC%[0;0m
set filename=null
set filenameext=null
goto command_s

:fm_rmfil
set filename=%commandargs%
call :filenamecheck2
del /f "%filename%" 2>NUL >NUL
echo %ESC%[0;92mSuccessfully Deleted File %filename%!%ESC%[0;0m
set filename=null
goto command_s

:fm_copy
set filefoldername=%commandargs%
REM call :folderfilenamecheck2
set CpDir=%commandargs2%
REM call :fmcpcheck
robocopy "%filefoldername%" "%CpDir%/%filefoldername%" /E 2>NUL >NUL || echo %ESC%[0;91mE: Failed to copy Folder/File%ESC%[0;0m && goto command_s
echo %ESC%[0;92mSuccessfully Copied %filefoldername% to %CpDir%!%ESC%[0;0m
set filefoldername=null
set CpDir=null
goto command_s

:fm_cut
set filefoldername=%commandargs%
call :folderfilenamecheck2
set MvDir=%commandargs2%
call :fmmvcheck
move /-Y "%filefoldername%" "%MvDir%" 2>NUL >NUL
echo %ESC%[0;92mSuccessfully Moved %filefoldername% to %MvDir%!%ESC%[0;0m
set filefoldername=null
set MvDir=null
goto command_s

:fm_rename
set filefoldername=%commandargs%
call :filefoldername
set filefoldernamerenameto=%commandargs2%
call :filefoldername
filefoldernamerenameto
rename "%filefoldername%" "%filefoldernamerenameto%" 2>NUL >NUL
echo %ESC%[0;92mSuccessfully Renamed File %filefoldername%!%ESC%[0;0m
set filename=null
goto command_s

:fm_cat
set filename=%commandargs%
call :filenamecheck2
for /f "tokens=*" %%s in (%filename%) do (
	endlocal
	echo %ESC%[0m%%s
)
setlocal EnableDelayedExpansion
set filename=null
goto command_s

:fm_ls
echo %ESC%[35mViewOS FileSystem (ViewFS) Version %viewfsver%%ESC%[0m > .viewfs_listing
REM echo %CD% | findstr "Disk" > NUL && echo Directory of: / >> .viewfs_listing
set lsdir=dir | findstr /N ".viewfs_root"
echo Directory of: %lsdir% >> .viewfs_listing
echo. >> .viewfs_listing
dir | findstr /V "^$ Directory of Volume in drive Volume in Serial Number .viewfs_" >> .viewfs_listing
type .viewfs_listing
del .viewfs_listing
goto command_s

:fm_cd
set foldername=%vdiskpath%\%commandargs%
call :foldernamecheck2
cd %foldername%
goto command_s

REM======================
REM CHECKS
REM======================

REM Folder
REm --------------------

:foldernamecheck
if "%foldername%"=="" echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if "%foldername%"==" " echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if "%foldername%"=="null" echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
EXIT /B 0

:foldernamecheck2
if "%foldername%"=="" echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if "%foldername%"==" " echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if "%foldername%"=="null" echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if not exist %foldername% set foldername=%foldername:%vdiskpath%=% && echo %ESC%[0;91mE: Folder %foldername% does not exist%ESC%[0;0m && goto command_s
EXIT /B 0

:foldernamecheck3
if "%foldername%"=="" echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if "%foldername%"==" " echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if "%foldername%"=="null" echo %ESC%[0;91mE: Please type a folder name%ESC%[0;0m && goto command_s
if exist %foldername% echo %ESC%[0;91mE: A Folder with that name already exists%ESC%[0;0m && goto command_s
EXIT /B 0

REM File
REm --------------------

:filenamecheck
if "%filename%"=="" echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if "%filename%"==" " echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if "%filename%"=="null" echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
EXIT /B 0

:filenamecheck2
if "%filename%"=="" echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if "%filename%"==" " echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if "%filename%"=="null" echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if not exist %filename% echo %ESC%[0;91mE: File %filename% does not exist%ESC%[0;0m && goto command_s
EXIT /B 0

:filenamecheck3
if "%filename%"=="" echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if "%filename%"==" " echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if "%filename%"=="null" echo %ESC%[0;91mE: Please type a file name%ESC%[0;0m && goto command_s
if exist %foldername% echo %ESC%[0;91mE: A File with that name already exists%ESC%[0;0m && goto command_s
EXIT /B 0

:fileextcheck
if "%filename%"=="" echo %ESC%[0;91mE: Please type a file extension%ESC%[0;0m && goto command_s
if "%filename%"==" " echo %ESC%[0;91mE: Please type a file extension%ESC%[0;0m && goto command_s
if "%filename%"=="null" echo %ESC%[0;91mE: Please type a file extension%ESC%[0;0m && goto command_s
EXIT /B 0

REM File/Folder
REm --------------------

:folderfilenamecheck
if "%filefoldername%"=="" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%filefoldername%"==" " echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%filefoldername%"=="null" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
EXIT /B 0

:folderfilenamecheck2
if "%filefoldername%"=="" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%filefoldername%"==" " echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%filefoldername%"=="null" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if not exist %filefoldername% echo %ESC%[0;91mE: File/Folder %filefoldername% does not exist%ESC%[0;0m && goto command_s
EXIT /B 0

:folderfilenamecheck3
if "%filefoldername%"=="" echo %ESC%[0;91mE: Please type a file/Folder name%ESC%[0;0m && goto command_s
if "%filefoldername%"==" " echo %ESC%[0;91mE: Please type a file/Folder name%ESC%[0;0m && goto command_s
if "%filefoldername%"=="null" echo %ESC%[0;91mE: Please type a file/Folder name%ESC%[0;0m && goto command_s
if exist %filefoldername% echo %ESC%[0;91mE: A File/Folder with that name already exists%ESC%[0;0m && goto command_s
EXIT /B 0

REM Cut/Copy
REm --------------------

:fmcpcheck
if "%CpDir%"=="" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%CpDir%"==" " echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%CpDir%"=="null" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if not exist "%CpDir%" echo %ESC%[0;91mE: Path does not exist%ESC%[0;0m && goto command_s
EXIT /B 0

:fmmvcheck
if "%MvDir%"=="" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%MvDir%"==" " echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if "%MvDir%"=="null" echo %ESC%[0;91mE: Please type a File/Folder name%ESC%[0;0m && goto command_s
if not exist "%MvDir%" echo %ESC%[0;91mE: Path does not exist%ESC%[0;0m && goto command_s
EXIT /B 0

REM------------------------
REM FUNCS
REM------------------------

:replacefileline <inputfile> <outputfile> <stringtoreplace> <stringreplacewith>
>"%~2" (
  for /f "usebackq delims=" %%A in ("%~1") do (
    if "%%A" equ "%~3" (echo %~4) else (echo %%A)
  )
)
EXIT /B 0

:logger <logseverity> <message>
if not exist "%logpath%\%date%.log" break>"%logpath%\%date%.log"
set severity=%~1
if not "%severity%"=="" (
	if "%severity%"=="0" (
		set severity=[ERROR]
	)
	if "%severity%"=="1" (
		set severity=[SUCCESS]
	)
	if "%severity%"=="2" (
		set severity=[INFO]
	)
	if "%severity%"=="3" (
		set severity=[DEBUG]
	)
	if "%severity%"=="4" (
		set severity=[FATAL]
	)
)
FOR /F "tokens=* USEBACKQ" %%F IN (`tzutil /g`) DO (
	SET timezone=%%F
)
set message=%~2
echo %date% - %time% - %timezone% ^| %severity% %message%>>"%logpath%\%date%.log"
EXIT /B 0

REM------------------------
REM Error Screen
REM------------------------

:errscr
cls
color 17
echo.
echo                     %ESC%[0;7m VIEWOS %ESC%[0;0m
echo %ESC%[97;44m
echo :/
echo.
echo %ESC%[0;44mViewOS%ESC%[97;44m Ran into a %ESC%[0;44mproblem%ESC%[97;44m^^! and needs to %ESC%[0;44mrestart%ESC%[97;44m.
echo.
echo  Here is the %ESC%[0;44minfo%ESC%[97;44m of the error:
echo.
echo  * Error: %ESC%[0;44m%errname%%ESC%[97;44m
echo  * ErrorCode: %ESC%[0;44m%errcode%%ESC%[97;44m
echo.
echo You can %ESC%[0;44mcontact the developer%ESC%[97;44m or open a %ESC%[0;44missue%ESC%[97;44m on %ESC%[0;44mgithub%ESC%[97;44m.
echo.
pause
cd..
start View_OS.bat && exit

:rmcmd
if not "%vusername%"=="root" echo %ESC%[0;91mE: You are not on Root^^!%ESC%[0;0m && goto command_s
call :logger 2 "user got trolled by rm command lmao"
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS.%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS..%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS...%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS.%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo %ESC%[0;44mUNINSTALLING VIEWOS..%ESC%[0m
echo.
ping localhost -n 2 >nul
cls
echo.
echo         %ESC%[0;7m VIEWOS %ESC%[0;0m
echo :)
echo.
echo	%ESC%[0;44mUNINSTALLING VIEWOS DONE%ESC%[0m
echo.
pause
echo %ESC%[0;7m You have been trolled ;) %ESC%[0;0m
ping localhost -n 3 >nul
cls
goto command_s


REM------------------------
REM COLORS
REM------------------------

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0