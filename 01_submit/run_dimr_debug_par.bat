rem %230721 victor.chavarrias@deltares.nl
rem 
rem %Debuggin in parallel.  
rem %1) Add `<waitFile>` to the dimr-configuration file.
rem %2) Partition the model (only once). You can use an already partitioned model. You can partition it in release or in debug with the statement here.
rem %3) Run this script.
rem %4) After the process is running, select Debug -> Attach to Process or press Ctrl+Alt+p in Visual Studio, and use the Attach to Process dialog to attach the debugger to all processed `dimr.exe`.
rem %5) Add the file specified in `<waitFile>`.
rem %6) In Visual Studio add a watch variable `m_partitioninfo::sdmn` to know which partition are you dealing with. 

rem %% 
rem %% INPUT
rem %% 

rem %number of partitions
set nPart=2 

rem %mdu-file name for partitioning (i.e., without '_0000') 
set mduFile=test.mdu 

rem %dimr-configuratio-file. It must contain the statement to wait for file such that you can attach to process. 
set dimrFile=dimr_par.xml 

rem %full path to directory with debug compilation
set D3D_HOME=C:\Users\chavarri\checkouts\delft3d_trunk\build_all\x64\Debug\

rem %architecture
set ARCH=x64

rem %%
rem %% PATHS
rem %%

set delwaqexedir=%D3D_HOME%
set dflowfmexedir=%D3D_HOME%
set dimrexedir=%D3D_HOME%
set esmfexedir=%D3D_HOME%
set esmfbatdir=%D3D_HOME%
set flow1dexedir=%D3D_HOME%
set flow1d2dexedir=%D3D_HOME%
set rrexedir=%D3D_HOME%
set rtctoolsexedir=%D3D_HOME%
set swanexedir=%D3D_HOME%
set swanbatdir=%D3D_HOME%
set sharedir=%D3D_HOME%
set waveexedir=%D3D_HOME%

set PATH=%dimrexedir%;%delwaqexedir%;%dflowfmexedir%;%flow1dexedir%;%flow1d2dexedir%;%rtctoolsexedir%;%rrexedir%;%waveexedir%;%swanbatdir%;%swanexedir%;%esmfbatdir%;%esmfexedir%;%sharedir%

rem %% 
rem %% CALL
rem %%  

rem %% partitioning

rem "%dflowfmexedir%\dflowfm-cli.exe" --partition:ndomains=%nPart%:icgsolver=6:genpolygon=1 %mduFile% 

rem %% call DIMR

"%sharedir%\mpiexec.exe" -n %nPart% -localonly "%dimrexedir%\dimr.exe" -d 9 %dimrFile%

rem %% call dflowfm

rem "%sharedir%\mpiexec.exe" -n %nPart% -localonly "%dimrexedir%\dflowfm-cli.exe" -d 9 %dimrFile%
