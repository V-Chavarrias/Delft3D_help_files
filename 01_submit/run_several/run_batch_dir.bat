@echo off 

rem
rem PREAMBLE
rem

SETLOCAL ENABLEDELAYEDEXPANSION rem necessary for changing variables inside loop. Then call with ! ! rather than % %

rem
rem INPUT
rem

set /A ini=9 rem initial simulation number
set /A fin=10 rem final simulation number
set seriepath=c:\Users\runs\trial\

rem 
rem CALL
rem 

for /l %%x in (%ini%, 1, %fin%) do (
	echo %%x
	if /I %%x LEQ 9 (
		set "simnum=00%%x"
	) else ( 
		set "simnum=0%%x" 
	) 
	rem echo "!simnum!"
	set runpath=%seriepath%!simnum!\
	cd !runpath!	
	start "%%x" run.bat 
)
rem pause