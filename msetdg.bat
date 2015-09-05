echo off
REM Full firmware packs can be downloaded from here: http://www.3dsiso.com/showthread.php?268700-MEGA-CIA-BIN-MSET-4-X-amp-6-X-backups-Browser-backups-Update-packs-(All-Regions)&highlight=msetdg
REM Script developed by WhoAmI? (Lavanoid)
REM Don't ever say that I haven't contributed to the scene. Go fuck yourself.
REM Credit goes to pakrett for supplying the files.
Title = 3DS Firmware Downloader
%~d0
cd %~dp0
echo.
echo Firmware downloader.
echo.
echo CD: %CD%
echo.
echo What do you want to download? (1-5)
echo.
echo 1.) MSET (Settings application)
echo 2.) Firm (N3DS)
echo 3.) Native firm (N3DS, encrypted)
echo 4.) Native firm (N3DS, decrypted)
echo 5.) Firm (O3DS)
echo.
:download_select
set download=
set /p download=Download: %=%
if "%download%"=="1" goto :mset
if "%download%"=="2" (
	set region=FIRM N3DS
	echo Downloading FIRM N3DS
	Title = Downloading FIRM N3DS...
	set version=9.5
	if not exist "%CD%\FIRM\N3DS" mkdir "%CD%\FIRM\N3DS"
	call :Download "https://dl.dropbox.com/s/xerkf653egaop6s/n3ds_firmware.bin?dl=0" "%CD%\FIRM\N3DS\firmware.bin"
	goto :EOF
)
if "%download%"=="3" (
	set region=NATIVE_FIRM N3DS ENC
	echo Downloading NATIVE_FIRM N3DS ENC
	Title = Downloading NATIVE_FIRM N3DS ENC...
	set version=9.5
	if not exist "%CD%\NATIVE_FIRM\ENC_N3DS" mkdir "%CD%\NATIVE_FIRM\ENC_N3DS"
	call :Download "https://dl.dropbox.com/s/rphsi6bdg68nhcn/enc_NATIVE_FIRM_n3DS.bin?dl=0" "%CD%\NATIVE_FIRM\ENC_N3DS\firmware.bin"
	goto :EOF
)
if "%download%"=="4" (
	set region=NATIVE_FIRM N3DS DEC
	echo Downloading NATIVE_FIRM N3DS DEC
	Title = Downloading NATIVE_FIRM N3DS DEC...
	set version=9.5
	if not exist "%CD%\NATIVE_FIRM\DEC_N3DS" mkdir "%CD%\NATIVE_FIRM\DEC_N3DS"
	call :Download "https://dl.dropbox.com/s/8pmd0731w15kq5d/dec_nativefirm3ds_0004013820000002.bin?dl=0" "%CD%\NATIVE_FIRM\DEC_N3DS\firmware.bin"
	goto :EOF
)
if "%download%"=="5" (
	set region=FIRM O3DS
	echo Downloading FIRM O3DS
	Title = Downloading FIRM O3DS...
	set version=?
	if not exist "%CD%\FIRM\O3DS" mkdir "%CD%\FIRM\O3DS"
	call :Download "https://dl.dropbox.com/s/fnouysgqrj4mg5o/o3dsfirmware.bin?dl=0" "%CD%\FIRM\O3DS\firmware.bin"
	goto :EOF
)
REM Some fun magic to see if the user even entered an integer value.
set test=%region%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 5...
@echo No, not a decimal, fraction or mixed fraction. HUSH!
if not "%test%"=="%region%" call :you_are_an_idiot
goto :download_select
:mset
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
@echo No, not a decimal, fraction or mixed fraction. HUSH!
if not "%test%"=="%region%" call :you_are_an_idiot
goto :region_select
:you_are_an_idiot
echo You didn't even enter a number, what the fuck?
Title = 3DS Firmware Downloader (you're an idiot)
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
	set version=%region% 4.x
	call :Download "https://dl.dropbox.com/s/8o86h3mnl643zc0/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading JPN 6.X...
	Title = Downloading MSET: JPN 6.X...
	set version=%region% 6.x
	call :Download "https://dl.dropbox.com/s/tvytnoqzrpvxwdc/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
@echo No, not a decimal, fraction or mixed fraction. HUSH!
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
	set version=%region% 4.x
	call :Download "https://dl.dropbox.com/s/0vrhdfvxpb5voh9/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading USA 6.X...
	Title = Downloading MSET: USA 6.X...
	set version=%region% 6.x
	call :Download "https://dl.dropbox.com/s/gazwh6o5a6dwlw2/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
@echo No, not a decimal, fraction or mixed fraction. HUSH!
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
	set version=%region% 4.x
	call :Download "https://dl.dropbox.com/s/1ab4x3citqylty0/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading EUR 6.X...
	Title = Downloading MSET: EUR 6.X...
	set version=%region% 6.x
	call :Download "https://dl.dropbox.com/s/yxqpdvfr6rfncjb/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
@echo No, not a decimal, fraction or mixed fraction. HUSH!
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
	set version=%region% 4.x
	call :Download "https://dl.dropbox.com/s/mslumpknhs157cc/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading CHN 6.X...
	Title = Downloading MSET: CHN 6.X...
	set version=%region% 6.x
	echo Sorry but I don't have this file :/ PM me it and it'll be added.
	pause
	REM call :Download "http:/blahblah"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
@echo No, not a decimal, fraction or mixed fraction. HUSH!
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select


:KOR
set region=KOR
echo.
echo What version do you want? (1-2)
echo.
echo 1.) 4.x   2.) 6.x
echo.
set version=
set /p version=Version: %=%
if "%version%"=="1" (
	echo Downloading KOR 4.X...
	Title = Downloading MSET: KOR 4.X...
	set version=%region% 4.x
	call :Download "https://dl.dropbox.com/s/uqpyjdjk9ia25ve/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading KOR 6.X...
	Title = Downloading MSET: KOR 6.X...
	set version=%region% 6.x
	call :Download "https://dl.dropbox.com/s/rqzm5s33tvg8huw/msetdg.bin?dl=0"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
@echo No, not a decimal, fraction or mixed fraction. HUSH!
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
	set version=%region% 4.x
	call :Download "https://dl.dropbox.com/s/rf2nrguo74aie5o/msetdg.bin?dl=0"
	goto :EOF
)
if "%version%"=="2" (
	echo Downloading TWN 6.X...
	Title = Downloading MSET: TWN 6.X...
	set version=%region% 6.x
	echo Sorry but I don't have this file :/ PM me it and it'll be added.
	pause
	REM call :Download "http:/blahblah"
	goto :EOF
)
set test=%version%
set /a test=%test%+1
set /a test=%test%-1
echo Wow... Are you an idiot? I told you to enter a number between 1 and 2... 
@echo No, not a decimal, fraction or mixed fraction. HUSH!
if not "%test%"=="%version%" call :you_are_an_idiot
goto region_select

:Download
echo.
echo Downloading file %1 ...
if not "%2"=="" (
	set saveto=%2
) else (
	set saveto="%CD%\%region%\%version%\msetdg.bin"
	if not exist "%CD%\%region%\%version%" mkdir "%CD%\%region%\%version%"
)

bitsadmin /transfer "Package: %region% %version%" /download /priority high %1 %saveto%
echo File saved as: %saveto%
echo Done! Press any key to exit.
pause >nul