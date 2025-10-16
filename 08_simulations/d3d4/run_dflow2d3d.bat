@ echo off
	rem Copy this file into your working directory.

	rem Remove existing dia-file
del tri-diag*
    
    rem Change the commandline parameters below; use the "--help" line to see all options.
call P:\d-hydro\delft3d4\Delft3D-FLOW_WAVE\6.04.02.142586\x64\dflow2d3d\scripts\run_dflow2d3d.bat config_d_hydro.xml 

	rem If using self-compiled solution, <d_hydro.exe> is not correctly copied.
rem set fpath_chekout=c:\checkouts\delft3d_bank_erosion
rem copy %fpath_chekout%\build_delft3d4\x64\Release\d_hydro\bin\d_hydro.exe %fpath_chekout%\build_delft3d4\x64\Release\dflow2d3d\bin\d_hydro.exe
rem call %fpath_chekout%\build_delft3d4\x64\Release\dflow2d3d\scripts\run_dflow2d3d.bat config_flow2d3d.xml 

    rem To prevent the DOS box from disappearing immediately: remove the rem on the following line
rem pause
