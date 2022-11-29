@echo off
echo L4D2 Addons Offline Mode Assistant for CN Players(Developed by TTPeter)
echo Version: 1.0
echo Date: 2022/11/30
echo Developers: TTPeter/LiuJiewenTT;
echo License: MIT License
echo Github Project Link: https://github.com/LiuJiewenTT/L4D2_OfflineAssistant
echo -----------------------------------------------------------------------

rem Settings
set profile=profile1
set printlog=false

rem Work preparation
set mpath=%~dp0
set workshopdir=%mpath%workshop\
set profiledir=%mpath%%profile%\
set markpath=%workshopdir%Amark.txt

rem Confirm infomation
echo Path: %mpath%
echo Selected Profile: %profile%
echo \n
echo workshop Dir: %workshopdir%
echo profile Dir: %profiledir%
echo Mark Location: %markpath%

echo Check Mark..

set flag=false

:loop

    if exist "%markpath%" (
        if %flag%==false (
            echo Mark Exists.
            set flag=true
        ) else (
            rem Do Nothing.
        )
        goto loop
    ) else (
        echo Mark is Missing, Copy now...
        if %printlog%==false (
            robocopy /S /MT:32  "%profiledir%\" "%workshopdir%\" /UNILOG:"log.txt"
        ) else (
            robocopy /S /MT:32 /NP "%profiledir%" "%workshopdir%"
        )
        echo Copy Complete.
        echo mark>>"%markpath%"
        echo Finish.
    )

if "%1"=="pause" (
    pause
)