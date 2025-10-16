@ echo off
	rem Copy this file into your working directory.

	rem Remove existing dia-file
rem del tri-diag*
    
	rem in p-drive only flow
rem call P:\d-hydro\delft3d4\Delft3D-FLOW_WAVE\6.04.02.142586\x64\dflow2d3d\scripts\run_dflow2d3d.bat config_flow2d3d.xml 

	rem in p-drive flow+wave
rem call P:\d-hydro\delft3d4\Delft3D-FLOW_WAVE\6.04.02.142586\x64\dflow2d3d\scripts\run_dflow2d3d_dwaves.bat -w r17.mdw config_d_hydro.xml

	rem If using self-compiled solution, <d_hydro.exe> is not correctly copied.
rem set fpath_chekout=c:\checkouts\sc_d3d4_trunk
rem copy %fpath_chekout%\build_delft3d4\x64\Release\d_hydro\bin\d_hydro.exe %fpath_chekout%\build_delft3d4\x64\Release\dflow2d3d\bin\d_hydro.exe
rem call %fpath_chekout%\install_delft3d4\bin\run_dflow2d3d.bat config_flow2d3d.xml 
call c:\checkouts\sc_d3d4_trunk\install_d3d4-suite\bin\run_dflow2d3d.bat config_flow2d3d.xml 

    rem To prevent the DOS box from disappearing immediately: remove the rem on the following line
pause
