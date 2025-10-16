rem Copy a release version of Delft3D 4 and Delft3D FM to another location
rem 230714 victor.chavarrias@deltares.nl

rem
rem INPUT
rem 

rem !!!ATTENTION: End path to directory without bar

rem directory to copy release files
set fdir_out=c:\02_projects\230712_erosed_cost\08_executables\01

rem Delft3D 4 checkout directory
set fdir_d3d4=c:\checkouts\delft3d_trunk

rem Delft3D FM checkout directory
set fdir_fm=c:\checkouts\delft3d_fm_trunk

rem 
rem CALC
rem 

rem create output directory
set fdir_x64=%fdir_out%\x64
mkdir %fdir_x64%

rem copy Delft3D 4
set fdir_d3d4_release=%fdir_d3d4%\build_delft3d4\x64\Release
xcopy /s /y %fdir_d3d4_release% %fdir_x64%

rem When building the solution, <d_hydro.exe> is not at the right location. You must copy it manually.
rem <\build_delft3d4\x64\Release\d_hydro\bin\d_hydro.exe> file need to be copied to <\build_delft3d4\x64\Release\dflow2d3d\bin\d_hydro.exe>
rem https://issuetracker.deltares.nl/browse/DELFT3D-37789
rem 
set fpath_dhydro_o=%fdir_d3d4_release%\d_hydro\bin\d_hydro.exe
set fpath_dhydro_d=%fdir_x64%\dflow2d3d\bin\d_hydro.exe
copy %fpath_dhydro_o% %fpath_dhydro_d%

rem copy Delft3D FM

set fdir_fm_release=%fdir_fm%\build_all\x64\Release
xcopy /s /y %fdir_fm_release% %fdir_x64%
