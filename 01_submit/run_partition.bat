@ echo off

call c:\checkouts\delft3d_fm_trunk\install_all\bin\run_dflowfm.bat "--partition:ndomains=2:icgsolver=7" Waal.mdu
rem call "c:\Program Files\Deltares\Delft3D FM Suite 2023.02 HM\plugins\DeltaShell.Dimr\kernels\x64\dflowfm\scripts\run_dflowfm.bat" "--partition:ndomains=2:icgsolver=7" Waal.mdu

rem 
rem END
rem 
rem To prevent the DOS box from disappearing immediately: remove the rem on the following line

pause

