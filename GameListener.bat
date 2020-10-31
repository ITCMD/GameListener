@echo off
if /i "%~1"=="/s" goto setupscript
if /i "%~1"=="-s" goto setupscript
if exist Bin cd Bin
title Game Listener for Killing Programs
setlocal EnableDelayedExpansion

rem defaults to no game running
:NoGame
title Game Listener for Killing Programs [No Game]
rem runs through listen list
for /f %%A in (listen.txt) do (
	tasklist | find /i "%%~A"
	rem finds exe in tasklist
	if !errorlevel!==0 (
		set killer=%%~A
		goto kill
	)
)
timeout /t 20
goto NoGame

:setupscript
echo Set objShell = CreateObject("WScript.Shell") > Start_Game_Listener.vbs
echo objShell.CurrentDirectory = "%cd%" >> Start_Game_Listener.vbs
echo Set oShell = CreateObject("WScript.Shell") >> Start_Game_Listener.vbs
echo oShell.Run """%~fnx0""", 0  >> Start_Game_Listener.vbs
echo Setup script created. Place in shell:startup.
exit /b




:kill
rem kills all tasks in bin\kill.txt
for /f %%A in (kill.txt) do (
	taskkill /f /im "%%~A"
)
rem kills any tasks in Bin\KillonGame\Game.name.txt
if exist "KillOnGame\%killer%.txt" (
	for /f "usebackq" %%A in ("KillOnGame\%killer%.txt") do (
		taskkill /f /im "%%~A"
	)
)
rem starts any tasks in Bin\LaunchOnGame\Game.name.txt
if exist "StartOnGame\%killer%.txt" (
	for /f "usebackq" %%A in ("LaunchOnGame\%killer%.txt") do (
		start "" "%%~A"

	)
)

goto Game

:Game
rem Runs listener slower on game running
title Game Listener for Killing Programs [Game]
for /f %%A in (listen.txt) do (
	tasklist | find /i "%%~A"
	if !errorlevel!==0 goto GameWait
)
goto Start

:GameWait
timeout /t 60
goto Game


:start
rem starts any programs in bin\start.txt
for /f "tokens=1,2* delims=!" %%A in (start.txt) do (
	start "" "%%~A"
)
goto NoGame