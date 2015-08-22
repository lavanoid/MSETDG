echo off
REM Full firmware packs can be downloaded from here: http://www.3dsiso.com/showthread.php?268700-MEGA-CIA-BIN-MSET-4-X-amp-6-X-backups-Browser-backups-Update-packs-(All-Regions)&highlight=msetdg
REM Script developed by WhoAmI? (Lavanoid)
REM Don't ever say that I haven't contributed to the scene. Go fuck yourself.
Title = MSET Downloader
%~d0
cd %~dp0
echo.
echo MSET Downloader
echo.
echo CD: %CD%
echo.
echo What is your region? (1-6)
echo.
echo 1.) JPN   2.) USA   3.) EUR
echo 4.) CHN   5.) KOR   6.) TWN
echo.
:region_select
set region=
set /p region=Region: %=%
if "%region%"=="1" goto :JPN
if "%region%"=="2" goto :USA
if "%region%"=="3" goto :EUR
if "%region%"=="4" goto :CHN
if "%region%"=="5" goto :KOR
if "%region%"=="6" goto :TWN
REM Some fun magic to see if the user even entered an integer value.
set test=%region%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 6... 
if not "%test%"=="%region%" call :you_are_an_idiot
goto :region_select
:you_are_an_idiot
echo You didn't even enter a number, what the fuck?
Title = MSET Downloader (you're an idiot)
goto :EOF
:JPN
set region=JPN
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 6.x (recommended for 2DS users)
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading JPN 4.X...
	Title = Downloading MSET: JPN 4.X...
	set version=4.x
	call :Download "https://dl.dropbox.com/s/8o86h3mnl643zc0/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading JPN 6.X...
	Title = Downloading MSET: JPN 6.X...
	set version=6.x
	call :Download "https://dl.dropbox.com/s/tvytnoqzrpvxwdc/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select

:USA
set region=USA
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 6.x (recommended for 2DS users)
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading USA 4.X...
	Title = Downloading MSET: USA 4.X...
	set version=4.x
	call :Download "https://dl.dropbox.com/s/0vrhdfvxpb5voh9/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading USA 6.X...
	Title = Downloading MSET: USA 6.X...
	set version=6.x
	call :Download "https://dl.dropbox.com/s/gazwh6o5a6dwlw2/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select


:EUR
set region=EUR
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 6.x (recommended for 2DS users)
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading EUR 4.X...
	Title = Downloading MSET: EUR 4.X...
	set version=4.x
	call :Download "https://dl.dropbox.com/s/1ab4x3citqylty0/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading EUR 6.X...
	Title = Downloading MSET: EUR 6.X...
	set version=6.x
	call :Download "https://dl.dropbox.com/s/yxqpdvfr6rfncjb/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select


:CHN
set region=CHN
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 6.x (recommended for 2DS users)
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading CHN 4.X...
	Title = Downloading MSET: CHN 4.X...
	set version=4.x
	call :Download "https://dl.dropbox.com/s/mslumpknhs157cc/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading CHN 6.X...
	Title = Downloading MSET: CHN 6.X...
	set version=6.x
	echo Sorry but I don't have this file :/ PM me it and it'll be added.
	pause
	REM call :Download "http:/blahblah"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select


:KOR
set region=KOR
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 5.x
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading KOR 4.X...
	Title = Downloading MSET: KOR 4.X...
	set version=4.x
	call :Download "https://dl.dropbox.com/s/uqpyjdjk9ia25ve/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading KOR 5.X...
	Title = Downloading MSET: KOR 5.X...
	set version=5.x
	call :Download "https://dl.dropbox.com/s/rqzm5s33tvg8huw/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select

:TWN
set region=TWN
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 6.x (recommended for 2DS users)
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading TWN 4.X...
	Title = Downloading MSET: TWN 4.X...
	set version=4.x
	call :Download "https://dl.dropbox.com/s/rf2nrguo74aie5o/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading TWN 6.X...
	Title = Downloading MSET: TWN 6.X...
	set version=6.x
	echo Sorry but I don't have this file :/ PM me it and it'll be added.
	pause
	REM call :Download "http:/blahblah"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select

:Download
echo.
echo Downloading file %1 ...
if not exist "%CD%\%region%\%version%" mkdir "%CD%\%region%\%version%"
bitsadmin /transfer "MSET Package: %region% %version%" /download /priority high %1 "%CD%\%region%\%version%\msetdg.bin"
echo File saved as: "%CD%\%region%\%version%\msetdg.bin"
echo Done! Press any key to exit.
pause >nul