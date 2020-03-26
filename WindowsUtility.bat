@echo off
@color 09
@title Windows Utility Beta 1.0.2.1
:: `bin\Data` source missing
cd bin\Data
mode con cols=111 lines=50 >nul
:Main
echo                                                                                              ____
echo ___              ___                         ________      _______   ___              ___   /    \
echo \  \            /  /   __    ____           )   ___  \    / _____ \  \  \            /  /  /  /\__\
echo  \  \    __    /  /   )  (  (  \\\   )  (   )  (   \  \  / /     \ \  \  \    __    /  /   \  \___
echo   \  \  /  \  /  /    )  (  )  (\\\  )  (   )  (    )  ()  (     )  (  \  \  /  \  /  /     \___  \
echo    \  \/    \/  /     )  (  )  ( \\\ )  (   )  (    )  ()  (     )  (   \  \/    \/  /      ___ \  \
echo     \    /\    /      )  (  )  (  \\\)  (   )  (___/  /  \ \_____/ /     \    /\    /       \  \/  /
echo      \__/  \__/       )__(  )  (   \____(   )________/    \_______/       \__/  \__/         \____/
echo.
echo          __      __     ___________   __    __           __   ___________
echo         )  (    )  (   (____   ____) )  (  )  (         )  ( (____   ____)\ \  / /
echo         )  (    )  (        ) (      )  (  )  (         )  (      ) (      \ \/ /
echo         )  (    )  (        ) (      )  (  )  (         )  (      ) (       )  (
echo         )  (    )  (        ) (      )  (  )  (         )  (      ) (       )  (
echo         )  \    /  (        ) (      )  (  )  (_______  )  (      ) (       )  (
echo          \________/         ) (      )__(  )__________) )  (      ) (       )  (
echo
echo                               Copyright 2012 Thomas Howe
echo.
set /p m=Please Enter A Command:
if %m%==shutdown shutdown /p
if %m%==restart shutdown /r /t 1
if %m%==wucolor goto Wucolor
if %mt==restartcus goto RestartT
if %m%==sysinfo  goto SystemInfo
if %m%==shutdowncus goto ShutdownT
if %m%==qcreated goto DiagCreateQ
if %m%==wucolor goto WuColor
:: `LogoffTimer` source missing
if %m%==logofft goto LogoffTimer
if %m%==logoff logoff
if %m%==wuver Version.vbs
if %m%==msver start winver.exe
:: `ChangeLegal` source missing
if %m%==legalview goto ChangeLegal
if %m%==cpusers RunDll32.exe shell32.dll,Control_RunDLL nusrmgr.cpl
:: `Cal` source missing
if %m%==calc goto Cal
if %m%==hibcom rundll32.exe PowrProf.dll,SetSuspendState
if %m%==lockusr RunDll32.exe user32.dll,LockWorkStation
if %m%==sleepcom rundll32.exe powrprof.dll,SetSuspendState 0,1,0
if %m%==cpm explorer.exe shell:::{21ec2020-3aea-1069-a2dd-08002b30309d}
if %m%==cpwifimgr explorer.exe shell:::{1fa9085f-25a2-489b-85d4-86326eedcd87}
if %m%==ejectcd goto EjectCd
if %m%==exit exit
if %m%==else echo x
cls goto Main
:WuColor
echo a.Color Presets
echo b.Custom Color Chooser
echo c.Back to Main Menu
set /p wuc=Please enter a letter:
if %wuc%==a goto WuColorP
if %wuc%==b goto WucolorC
if %wuc%==c goto Emain
cls
goto Main
:WuColorP
echo a.Powershell
echo b.Evil on black
echo c.Oldie
echo d.Light Green on black
echo e.Golden day
echo f.Default
echo g.Back to Main Menu
set /p wucp=Please enter a letter:
if %wucp%==a color 1f
if %wucp%==b color 0c
if %wucp%==c color 8f
if %wucp%==d color 0e
if %wucp%==e color 0e
if %wucp%==f color 09
if %wucp%==g cls & goto Main
cls
goto Main
:Ejectcd
set /p cdn=what cd drive letter do you want to eject? No colon:
:: `EJECTCD` source missing
EJECTCD.exe %cdn%: >nul
:Emain
cls
goto Main
:RestartT
(
set /p Rett=Time Until Restart in seconds:
shutdown /r /t %rett%
echo Your Computer Will Restart in %n% seconds.
PING 1.1.1.1 -n 1 -w 3000 >NUL
cls
goto Main
)
:SystemInfo
(
systeminfo
pause>nul
cls
goto Main
)
:SystemInfoP
(
:: `System` source missing
cd bin\Data\Info\System
if %date%sysinfo.log exist
(
echo Error, you already recored system info today.
cls
goto Main
)
if %date%sysinfo.log not exist
(
systeminfo>%date%sysinfo.log
pause>nul
echo Backed up system information
cls
goto Main
)
:ShutdownT
(
set /p Shtmi=Minutes Until Shutdown:
set /p Shts=Seconds Until Shutdown:
set /a Shtm=60*%Shtmi%
set /a Shtt=60*%Shtm%+%Shts%
echo Shutting Down in:
echo Min: %Shtm% Sec: %Shts%
shutdown /s /t %Shtt%
PING 1.1.1.1 -n 1 -w 3000 >NUL
cls
goto Main
:DiagCreateQ
(
:: `GenDiag` source missing
cd Data\temporary\GenDiag
set /p Qdbody=What will the dialog say?:
set /p Qdtitle=What will the tile be?:
set /p Qdfname=What is the file names?:
echo x = MsgBox("%Qdbody%",64,"%Qdtitle%")>%Qdfname%.vbs
%Qdfname%.vbs
pause>nul
cls
goto Main
)
