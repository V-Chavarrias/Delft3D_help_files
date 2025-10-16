@ echo off
    rem
    rem This script is an example for running Delft3D-WAVE (Windows)
    rem Adapt and use it for your own purpose
    rem
    rem adri.mourits@deltares.nl
    rem 18 jun 2015
    rem
    rem Set version numbers here
    rem example:
set versionnr=6.04.02.142586
    rem Please use the latest version available at "p:\h6\opt\delft3d4\Delft3D-FLOW_WAVE" when possible
if ["%versionnr%"] EQU ["6.09.09.9999"] (
    echo "ERROR in runscript: version number not specified"
    echo "                    Please choose a version at p:\h6\opt\delft3d4\Delft3D-FLOW_WAVE,"
    echo "                    preferably the latest version"
    echo "      Open the runscript in a text editor and change the following line:"
    echo "      set versionnr=6.09.09.9999"
    goto end
)


    rem 
    rem Set the mdw file here
    rem 
set mdwave=45mGrid.mdw 





    rem
    rem Set the directories containing wave.exe and swan.bat here
    rem
echo When error message "The system cannot find the path specified." appears below:
echo   Check "ARCH" in the run-script:
echo     Version 6.01.17.5275 and older: default ARCH=win32
echo     Version 6.01.18.5368 and newer: default ARCH=win64
set ARCH=x64
  rem set D3D_HOME=c:\Program Files (x86)\Deltares\%versionnr%
set D3D_HOME=p:\d-hydro\delft3d4\Delft3D-FLOW_WAVE\%versionnr%
set waveexedir=%D3D_HOME%\%ARCH%\dwaves\bin
set swanexedir=%D3D_HOME%\%ARCH%\swan\bin
set swanbatdir=%D3D_HOME%\%ARCH%\swan\scripts
set sharedir=%D3D_HOME%\%ARCH%\share\bin

    rem
    rem No adaptions needed below
    rem


    rem Run
set PATH=%waveexedir%;%swanbatdir%;%swanexedir%;%sharedir%;%PATH%
%waveexedir%\wave.exe %mdwave% 0


:end
    rem To prevent the DOS box from disappearing immediately: remove the rem on the following line
pause
