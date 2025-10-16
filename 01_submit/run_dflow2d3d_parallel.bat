@ echo off


    rem When using mpich2 for the first time on a machine:
    rem Execute "smpd -install" as administrator:
    rem     Preparation: Check that your Delft3D installation contains "...\x64\share\bin\smpd.exe". Optionally copy it to a local directory (it will run as a service).
    rem     "Start" -> "All programs" -> "Accessories", right-click "Command Prompt", "Run as Administrator"
    rem     In this command box:
    rem         cd ...\x64\share\bin
    rem         smpd -install
    rem     When there is an smpd already running on the machine, it must be ended first, using the Microsoft Task Manager, 
    rem     or in the command  box: smpd -uninstall

    rem
    rem This script runs dimr in parallel mode on Windows
    rem Adapt and use it for your own purpose
    rem
    rem Usage example:
    rem Execute in the working directory:
    rem path\to\delft3d\installation\x64\dimr\scripts\run_dimr_parallel.bat
    rem More examples: check run scripts in https://svn.oss.deltares.nl/repos/delft3d/trunk/examples/*


set NPROC=2
call p:\d-hydro\delft3d4\Delft3D-FLOW_WAVE\6.04.00.69179\x64\dflow2d3d\scripts\run_dflow2d3d_parallel.bat  %NPROC% config_flow2d3d.xml
rem call c:\checkouts\sc_d3d4_trunk\install_delft3d4\bin\run_dflow2d3d_parallel.bat %NPROC% config_d_hydro_w.xml 

REM To run in debug mode, use this script to start the run and call a config-file that waits for file. Attach to process and proceed.
rem call c:\checkouts\sc_branch\install_delft3d4\bin\run_dflow2d3d_parallel.bat %NPROC% config_d_hydro_wait.xml 

pause
