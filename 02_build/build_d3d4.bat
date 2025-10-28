REM Run this script from a OneAPI command prompt
REM add IntelAPI paths
call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2022 
set IFORT_COMPILER24=C:\Program Files (x86)\Intel\oneAPI\compiler\2024.2\ 
SET PATH=c:\Program Files\CMake\bin\;c:\Users\chavarri\AppData\Local\miniforge3\;%PATH%

call build.bat -config d3d4-suite -build_type Debug -compiler ifx
pause