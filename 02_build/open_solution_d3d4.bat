set randomNumber=%RANDOM%
set tmp=c:\checkouts\tmp_%randomNumber%
set temp=c:\checkouts\temp_%randomNumber%

REM add IntelAPI paths
call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2022 
set IFORT_COMPILER24=C:\Program Files (x86)\Intel\oneAPI\compiler\2024.2\ 
SET PATH=c:\Program Files\CMake\bin\;c:\Users\chavarri\AppData\Local\miniforge3\;%PATH%

REM open solution
call "c:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\devenv.exe" ".\build_d3d4-suite\d3d4-suite.sln"