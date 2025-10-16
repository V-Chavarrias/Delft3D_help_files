@echo off
SET mypath=%~dp0
mkdir %mypath%\src\third_party\interacter
svn checkout https://repos.deltares.nl/repos/ds/branches/dflowfm/dflowfm_interacter/third_party/interacter %mypath%\src\third_party\interacter

REM add IntelAPI paths
call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2022 
set IFORT_COMPILER24=C:\Program Files (x86)\Intel\oneAPI\compiler\2024.2\ 
SET PATH=c:\Program Files\CMake\bin\;c:\Users\chavarri\AppData\Local\miniforge3\;%PATH%

call build_interacter.bat

pause