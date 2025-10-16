@ echo off
set argfile=config_flow2d3d.xml
set ARCH=win64
set D3D_HOME="C:\Program Files\Deltares\Delft3D 4.03.02\"
set exedir=%D3D_HOME%\%ARCH%\flow2d3d\bin
set PATH=%exedir%;%PATH%
%exedir%\d_hydro.exe %argfile%
:end
