@echo off
%~d0
cd %~dp0
Title = Environment installer
REM ##################### ADMIN STUFF #####################
if exist "elevate.vbs" del /f "elevate.vbs"
echo Hang on a sec... Checking priviledges...
mkdir "%SystemRoot%\AdminAccessCheck" 2>nul
if not exist "%SystemRoot%\AdminAccessCheck" goto :admin
RD /S /Q "%SystemRoot%\AdminAccessCheck"
REM ##################### BACKUP #####################
if not exist "%appdata%\rxToolsBuildKit\backups" mkdir "%appdata%\rxToolsBuildKit\backups"
if not exist "%appdata%\rxToolsBuildKit\backups\userenv.reg" (
  echo [BACKUP] Backing up user environment...
  reg export "HKEY_CURRENT_USER\Environment" "%appdata%\rxToolsBuildKit\backups\userenv.reg"
)
if not exist "%appdata%\rxToolsBuildKit\backups\systemenv.reg" (
  echo [BACKUP] Backing up system environment...
  reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "%appdata%\rxToolsBuildKit\backups\systemenv.reg"
)
if not exist "%appdata%\rxToolsBuildKit\backups\userenv.reg" (
  echo Failed to create a backup of the user environment.
  echo Cannot install.
  color c
  goto :endpause
)
if not exist "%appdata%\rxToolsBuildKit\backups\systemenv.reg" (
  echo Failed to create a backup of the system environment.
  echo Cannot install.
  color c
  goto :endpause
)
REM ##################### CREATE DIRECTORYS #####################
if not exist "%appdata%\rxToolsBuildKit\downloads" mkdir "%appdata%\rxToolsBuildKit\downloads"
if not exist "%appdata%\rxToolsBuildKit\downloads" (
  echo WOW! WWWOOOWW!! D: I couldn't make a directory!
  echo Have you been wanking on your computer?
  echo Cannot install.
  color c
  goto :endpause
)
cls
REM ##################### DOWNLOAD STUFF #####################
echo [STAT] Shit backed up.
bitsadmin /transfer "Package: wget" /download /priority high "https://dl.dropbox.com/s/2p4lzq1itlsajyd/wget.exe" "%appdata%\rxToolsBuildKit\downloads\wget.exe"
echo [DOWNLOAD] Python2
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://www.python.org/ftp/python/2.7.10/python-2.7.10.msi" -O "%appdata%\rxToolsBuildKit\downloads\python-2.7.10.msi"
Title = Environment installer
if not exist "%appdata%\rxToolsBuildKit\downloads\python-2.7.10.msi" (
  echo **ERROR** I can't find python. What the fuck happened? 0_o
  echo Cannot install.
  color c
  goto :endpause
)
echo [DOWNLOAD] DevkitPro
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://dl.dropbox.com/s/m8qv4vy6bddhten/devkitProUpdater-1.5.4.exe" -O "%appdata%\rxToolsBuildKit\downloads\devkitProUpdater-1.5.4.exe"
Title = Environment installer
if not exist "%appdata%\rxToolsBuildKit\downloads\devkitProUpdater-1.5.4.exe" (
  echo.
  echo **ERROR** devkitPro must have taken a dump because I can't find it.
  echo Cannot install.
  color c
  goto :endpause
)
echo [DOWNLOAD] ImageMagick Portable x86
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://dl.dropbox.com/s/hl6w7oovhs0s8nm/ImageMagick-6.9.2-3-portable-Q16-x86.zip" -O "%appdata%\rxToolsBuildKit\downloads\ImageMagick-6.9.2-3-portable-Q16-x86.zip"
if not exist "%appdata%\rxToolsBuildKit\downloads\ImageMagick-6.9.2-3-portable-Q16-x86.zip" (
  echo.
  echo **ERROR** I can't find "%appdata%\rxToolsBuildKit\downloads\ImageMagick-6.9.2-3-portable-Q16-x86.zip" :/
  echo Cannot install.
  color c
  goto :endpause
)
echo [DOWNLOAD] armips
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://dl.dropbox.com/s/nhq0shjbxlayyp8/armips.exe" -O "%appdata%\rxToolsBuildKit\downloads\armips.exe"
if not exist "%appdata%\rxToolsBuildKit\downloads\armips.exe" (
  echo.
  echo **ERROR** I can't find "%appdata%\rxToolsBuildKit\downloads\armips.exe" :/
  echo Cannot install.
  color c
  goto :endpause
)
echo [DOWNLOAD] MinGW
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://dl.dropbox.com/s/8n4ou1yc3c1hfgo/mingw.zip" -O "%appdata%\rxToolsBuildKit\downloads\mingw.zip"
if not exist "%appdata%\rxToolsBuildKit\downloads\mingw.zip" (
  echo.
  echo **ERROR** I can't find "%appdata%\rxToolsBuildKit\downloads\mingw.zip" :/
  echo Cannot install.
  color c
  goto :endpause
)
echo [DOWNLOAD] 7-zip command line
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://dl.dropbox.com/s/49fdd3oyi1e1qse/7za.exe" -O "%appdata%\rxToolsBuildKit\downloads\7za.exe"
if not exist "%appdata%\rxToolsBuildKit\downloads\7za.exe" (
  echo.
  echo **ERROR** I can't find "%appdata%\rxToolsBuildKit\downloads\7za.exe" :/
  echo Cannot install.
  color c
  goto :endpause
)
echo [DOWNLOAD] Git portable
"%appdata%\rxToolsBuildKit\downloads\wget.exe" "https://dl.dropbox.com/s/06gvvz7s64o9pcq/PortableGit.zip" -O "%appdata%\rxToolsBuildKit\downloads\PortableGit.zip"
if not exist "%appdata%\rxToolsBuildKit\downloads\PortableGit.zip" (
  echo.
  echo **ERROR** I can't find "%appdata%\rxToolsBuildKit\downloads\PortableGit.zip" :/
  echo Cannot install.
  color c
  goto :endpause
)
Title = Environment installer
REM ##################### INSTALL STUFF #####################
echo [STAT] Python2 - Installing your shit...
explorer "%appdata%\rxToolsBuildKit\downloads\python-2.7.10.msi"
echo #####################
color B
echo Where did you install python to? Leave blank for the default
echo ^(%SystemDrive%\Python27^)
set /p py=Path: %=%
color 7
if "%py%"=="" (
  echo Using default directory.
  set py=%SystemDrive%\Python27
)
echo [STAT] DevkitPro - Installing that shit... One sec.
echo        Just select all installation optionsand you're good.
explorer "%appdata%\rxToolsBuildKit\downloads\devkitProUpdater-1.5.4.exe"
echo #####################
color B
echo [STAT] M'kay, now where did you install DevkitPro? Leave blank for default
echo ^(%SystemDrive%\devkitPro^)
set /p dkp=Path: %=%
color 7
if "%dkp%"=="" (
  echo Using default directory.
  set dkp=%SystemDrive%\devkitPro
)
Title = Environment installer - Extracting MinGW
echo [STAT] Extracting MinGW
if exist "%TEMP%\MinGW" RD /S /Q "%TEMP%\MinGW"
mkdir "%TEMP%\MinGW"
"%appdata%\rxToolsBuildKit\downloads\7za.exe" -y e "%appdata%\rxToolsBuildKit\downloads\mingw.zip" -o"%TEMP%\MinGW" -r
if not exist "%TEMP%\MinGW" (
  echo [ERROR] I can't find "%TEMP%\MinGW" :/
  echo Cannot install.
  color c
  goto :endpause
)
Title = Environment installer - Extracting PortableGit
echo [STAT] Extracting PortableGit
if exist "%TEMP%\PortableGit" RD /S /Q "%TEMP%\PortableGit"
mkdir "%TEMP%\PortableGit"
"%appdata%\rxToolsBuildKit\downloads\7za.exe" -y e "%appdata%\rxToolsBuildKit\downloads\PortableGit.zip" -o"%TEMP%\PortableGit" -r
if not exist "%TEMP%\PortableGit" (
  echo [ERROR] I can't find "%TEMP%\PortableGit" :/
  echo Cannot install.
  color c
  goto :endpause
)
Title = Environment installer - Extracting ImageMagick
echo [STAT] Extracting ImageMagick Portable x86
if exist "%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86" RD /S /Q "%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86"
mkdir "%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86"
"%appdata%\rxToolsBuildKit\downloads\7za.exe" -y e "%appdata%\rxToolsBuildKit\downloads\ImageMagick-6.9.2-3-portable-Q16-x86.zip" -o"%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86" -r
if not exist "%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86" (
  echo [ERROR] I can't find "%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86" :/
  echo Cannot install.
  color c
  goto :endpause
)
Title = Environment installer - Install
echo [STAT] Moving Github portable to the root of the %SystemDrive% drive...
mkdir "%SystemDrive%\PortableGit"
move /Y "%TEMP%\PortableGit\*" "%SystemDrive%\PortableGit"
if not exist "%SystemDrive%\PortableGit" (
   echo [ERROR] WOAH! Something happened! I couldn't move the crap over! D:
   echo Cannot install.
   color c
   goto :endpause
)
echo [STAT] Moving MinGW to the root of the %SystemDrive% drive...
mkdir "%SystemDrive%\MinGW"
move /Y "%TEMP%\MinGW\*" "%SystemDrive%\MinGW"
if not exist "%SystemDrive%\MinGW" (
  echo.
  echo [ERROR] Woah, what the hell happened? Windows: That's what happned.
  echo Looks like the copy failed. That sucks.
  echo Cannot install.
  color c
  goto :endpause
)
echo [STAT] Moving ImageMagick Portable x86 to the root of the %SystemDrive% drive...
mkdir "%SystemDrive%\ImageMagick-6.9.2-3-portable-Q16-x86"
move /Y "%TEMP%\ImageMagick-6.9.2-3-portable-Q16-x86\*" "%SystemDrive%\ImageMagick-6.9.2-3-portable-Q16-x86"
if not exist "%SystemDrive%\ImageMagick-6.9.2-3-portable-Q16-x86" (
  echo.
  echo [ERROR] Woah, what the hell happened? Windows: That's what happned.
  echo Looks like the copy failed. That sucks.
  echo Cannot install.
  color c
  goto :endpause
)
echo [STAT] Installing ARMIPS....
cd %dkp%
move /y "%appdata%\rxToolsBuildKit\downloads\armips.exe" "%CD%\msys\bin\"
if not exist "%CD%\msys\bin\armips.exe" echo Failed to install ARMIPS. Skipping.
%~d0
cd %~dp0
echo Okay, I think that's everything. Now to rape your registry.
echo Writing system path variable...
setx /m PATH "%dkp%\msys\bin;%SystemDrive%\ImageMagick-6.9.2-3-portable-Q16-x86;%dkp%\devkitARM\bin;%SystemDrive%\MinGW\bin;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%py%;%SystemDrive%\PortableGit\bin"
echo Erasing user path variable...
setx PATH ""
echo.
echo Okay, so now your registry has digital cum added to it (That's a good thing).
echo.
echo Just a little bit moreeeee....
setx /m PATHEXT "%PATHEXT%;.PY"
echo.
echo AAAhh. Thats it! :D 8=====D
color A
echo.
Title = Environment installer - Done
echo Done! Everything was a success (I hope)!
echo So now you just run "Build_rxTools.bat" :D
goto :endpause
:admin
if "%1"=="admin" (
  echo Seems like you don't have the appropriate priviledges.
  echo Oh well. Go ask mommy to be an admin.
  goto :endpause
)
echo Gaining elevated access via UAC...
set THISPROGRAM=%0
set THISPROGRAM=%THISPROGRAM:"=%
set THISPROGRAM="%THISPROGRAM%"
@echo Set UAC = CreateObject("Shell.Application")> "elevate.vbs"
@echo Set args = WScript.Arguments>> "elevate.vbs"
@echo UAC.ShellExecute %THISPROGRAM%, "admin", "", "runas", 1 >> "elevate.vbs"
wscript "elevate.vbs" >>nul
exit
:endpause
pause
