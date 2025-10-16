@ echo off

rem
rem SEQUENTIAL
rem 

rem call "c:\Program Files\Deltares\Delft3D FM Suite 2024.03 HM\plugins\DeltaShell.Dimr\kernels\x64\bin\run_dimr.bat" dimr_config.xml 
rem call p:\d-hydro\dimrset\weekly\latest\x64\bin\run_dimr.bat dimr_config.xml 
rem call c:\checkouts\delft3d_branch\install_all\bin\run_dimr.bat  dimr_config.xml 
rem call c:\checkouts\delft3d_fm_trunk\install_all\dflowfm-cli.exe da3.mdu --autostartstop
rem call P:\d-hydro\dimrset\2024\2024.03\x64\bin\run_dimr.bat dimr_config.xml
call c:\checkouts\sc_fm_trunk\install_fm-suite\bin\run_dimr.bat dimr_config.xml

rem 
rem PARALLEL
rem 
rem The model is assumed to be already partitioned. 

rem call c:\checkouts\delft3d_fm_trunk\install_all\bin\run_dimr_parallel.bat 4 dimr_config.xml

rem 
rem END
rem 
rem To prevent the DOS box from disappearing immediately: remove the rem on the following line

pause
